output "s3_bucket_id" {
  description = "ID (name) of the S3 bucket"
  value       = aws_s3_bucket.sagemaker.id
}
