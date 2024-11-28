# Integration with Lambda
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = var.api_id
  integration_type = "AWS_PROXY"
  integration_uri  = var.integration_uri
}

# Default Route
resource "aws_apigatewayv2_route" "default_route" {
  api_id    = var.api_id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}