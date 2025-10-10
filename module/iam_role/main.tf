resource "aws_iam_role" "sagemaker_execution_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "sagemaker_policy" {
  name        = var.policy_name
  description = "Policy for SageMaker to access S3, ECR, CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "S3Access"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          var.s3_bucket_arn,
          "${var.s3_bucket_arn}/*"
        ]
      },

    ]
  })
}

resource "aws_iam_role_policy_attachment" "sagemaker_attach" {
  role       = aws_iam_role.sagemaker_execution_role.name
  policy_arn = aws_iam_policy.sagemaker_policy.arn
}
