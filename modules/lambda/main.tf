
# Attach IAM policy
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = var.lambda_role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda Function
resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.lambda_role_arn
  package_type  = "Image"
  image_uri     = var.image_uri
  timeout       = var.timeout
  memory_size   = var.memory_size
}

resource "aws_iam_role_policy" "ecr_access_policy" {
  name = "ECRAccessPolicy"
  role = var.lambda_role_id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ecr:GetAuthorizationToken",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer"
        ],
        "Resource" : "arn:aws:ecr:${var.region}:${var.account_id}:repository/${var.repository_name}"
      }
    ]
  })
}

