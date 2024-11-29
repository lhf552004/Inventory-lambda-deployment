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

resource "aws_lambda_permission" "allow_apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${var.account_id}:${var.api_id}/*"
}
