provider "aws" {
  region = var.aws_region
}

# Create the IAM Role for Lambda
resource "aws_iam_role" "lambda_execution_role" {
  name = var.lambda_role_name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# Call the ECR module
module "ecr" {
  source          = "./modules/ecr"
  name            = var.ecr_name
  lambda_role_arn = aws_iam_role.lambda_execution_role.arn
}

# Call the Lambda module
module "lambda" {
  source           = "./modules/lambda"
  lambda_role_arn  = aws_iam_role.lambda_execution_role.arn
  lambda_role_name = aws_iam_role.lambda_execution_role.name
  lambda_role_id   = aws_iam_role.lambda_execution_role.id
  function_name    = var.lambda_function_name
  image_uri        = "${module.ecr.repository_url}:latest"
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory_size
  region           = var.aws_region
  account_id       = var.account_id
  repository_name  = var.ecr_name
}

# Call the API Gateway module
module "api_gateway" {
  source          = "./modules/api_gateway"
  name            = var.api_gateway_name
  integration_uri = module.lambda.function_arn
}
