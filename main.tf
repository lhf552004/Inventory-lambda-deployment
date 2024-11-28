provider "aws" {
  region = var.aws_region
}

# Call the Lambda module
module "lambda" {
  source           = "./modules/lambda"
  function_name    = var.lambda_function_name
  lambda_role_name = var.lambda_role_name
  image_uri        = "${module.ecr.repository_url}:${var.image_tag}"
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory_size
}

# Call the API Gateway module
module "api_gateway" {
  source          = "./modules/api_gateway"
  integration_uri = module.lambda.function_arn
  api_id = var.api_id
}
