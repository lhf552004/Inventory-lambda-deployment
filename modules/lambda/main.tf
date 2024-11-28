# Lambda Function
resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = data.aws_iam_role.lambda_execution_role.arn
  package_type  = "Image"
  image_uri     = var.image_uri
  timeout       = var.timeout
  memory_size   = var.memory_size
}

# Create the IAM Role for Lambda
data "aws_iam_role" "lambda_execution_role" {
  name = var.lambda_role_name
}