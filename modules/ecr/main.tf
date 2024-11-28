# Create ECR Repository
data "aws_ecr_repository" "this" {
  name = var.name
}

resource "aws_ecr_repository_policy" "lambda_access_policy" {
  repository = data.aws_ecr_repository.this.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowLambdaAccess",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : var.lambda_role_arn
        },
        "Action" : [
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer"
        ]
      }
    ]
  })
}

