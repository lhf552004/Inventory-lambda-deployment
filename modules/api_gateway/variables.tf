variable "integration_uri" {
  description = "Integration URI (e.g., Lambda invoke URL)"
  type        = string
}

variable "api_id" {
  description = "API ID"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "account_id" {
  description = "AWS account id"
  type        = string
}

variable "lambda_function_arn" {
  description = "Lambda function arn"
  type        = string
}
