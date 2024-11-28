variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "image_uri" {
  description = "URI of the Docker image"
  type        = string
}

variable "timeout" {
  description = "Timeout for the Lambda function in seconds"
  type        = number
  default     = 15
}

variable "memory_size" {
  description = "Memory size for the Lambda function"
  type        = number
  default     = 512
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "account_id" {
  description = "AWS account id"
  type        = string
}

variable "repository_name" {
  description = "AWS ecr repository"
  type        = string
}

variable "lambda_role_arn" {
  description = "The ARN of the IAM role for Lambda"
  type        = string
}

variable "lambda_role_name" {
  description = "The name (ID) of the IAM role for Lambda"
  type        = string
}

variable "lambda_role_id" {
  description = "The Id of the IAM role for Lambda"
  type        = string
}

