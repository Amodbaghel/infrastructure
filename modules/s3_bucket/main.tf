resource "aws_s3_bucket" "sagemaker" {
  bucket = var.name
}

resource "aws_s3_bucket_ownership_controls" "sage" {
  bucket = aws_s3_bucket.sagemaker.id
  rule {
    object_ownership = var.ownership
  }
}

resource "aws_s3_bucket_acl" "sagemakerr" {
  depends_on = [aws_s3_bucket_ownership_controls.sage]

  bucket = aws_s3_bucket.sagemaker.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.sagemaker.id
  versioning_configuration {
    status = "Enabled"
  }
}

