variable "name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "integration_uri" {
  description = "Integration URI (e.g., Lambda invoke URL)"
  type        = string
}
