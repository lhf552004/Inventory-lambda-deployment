provider "aws" {
  region = var.aws_region
}

# Call the ECR module
module "ecr" {
  source = "./modules/ecr"
  name   = var.ecr_name
}

# Call the Lambda module
module "lambda" {
  source        = "./modules/lambda"
  role_name     = var.lambda_role_name
  function_name = var.lambda_function_name
  image_uri     = "${module.ecr.repository_url}:latest"
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory_size
}

# Call the API Gateway module
module "api_gateway" {
  source          = "./modules/api_gateway"
  name            = var.api_gateway_name
  integration_uri = module.lambda.function_arn
}