provider "aws" {
  region = "us-west-2"
}

resource "aws_ecr_repository" "api_repository" {
  name = "inventory-management-api"
}

resource "aws_lambda_function" "api_lambda" {
  function_name = "InventoryManagementApi"
  role          = aws_iam_role.lambda_role.arn
  handler       = "bootstrap"
  image_uri     = "${aws_ecr_repository.api_repository.repository_url}:latest"
  package_type  = "Image"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_apigatewayv2_api" "http_api" {
  name          = "MyHttpApi"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "dev"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.http_api.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.api_lambda.invoke_arn
}

resource "aws_apigatewayv2_route" "default_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "ANY /{proxy+}"
  target    = aws_apigatewayv2_integration.lambda_integration.id
}

output "api_url" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}
