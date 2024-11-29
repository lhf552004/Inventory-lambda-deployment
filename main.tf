provider "aws" {
  region = var.aws_region
}

# Call the Lambda module
module "lambda" {
  source           = "./modules/lambda"
  function_name    = var.lambda_function_name
  lambda_role_name = var.lambda_role_name
  image_uri        = "${var.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/${var.repository_name}:${var.image_tag}"
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory_size
}

# Call the API Gateway module
module "api_gateway" {
  source              = "./modules/api_gateway"
  integration_uri     = module.lambda.function_arn
  api_id              = var.api_id
  account_id          = var.account_id
  lambda_function_arn = module.lambda.function_arn
  aws_region          = var.aws_region
}
