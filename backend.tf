terraform {
  backend "s3" {
    bucket         = "inventory-lambda-terraform-state-bucket"
    key            = var.state_key
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
