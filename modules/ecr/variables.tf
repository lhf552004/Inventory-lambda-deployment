variable "name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN of the Lambda execution role that requires access to the ECR repository"
  type        = string
}
