output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "lambda_function_arn" {
  value = module.lambda.function_arn
}

output "api_gateway_url" {
  value = module.api_gateway.api_url
}
