variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "account_id" {
  description = "AWS account id"
  type        = string
}

variable "lambda_role_name" {
  description = "Name of the IAM role for Lambda"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_timeout" {
  description = "Timeout for the Lambda function"
  type        = number
  default     = 15
}

variable "lambda_memory_size" {
  description = "Memory size for the Lambda function"
  type        = number
  default     = 512
}

variable "image_tag" {
  description = "Image tag from docker image built"
  type        = string
}

variable "api_id" {
  description = "Gateway API id"
  type        = string
}

variable "repository_name" {
  description = "ECR repository"
  type        = string
}
