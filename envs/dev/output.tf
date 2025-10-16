# --------------------------
# VPC Outputs
# --------------------------


# --------------------------
# S3 Bucket Outputs
# --------------------------
output "s3_bucket_name" {
  description = "Name of the S3 bucket used for SageMaker artifacts"
  value       = module.s3.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket used for SageMaker artifacts"
  value       = module.s3.s3_bucket_arn
}

# --------------------------
# IAM Role Outputs
# --------------------------
output "sagemaker_role_arn" {
  description = "ARN of the IAM role used by SageMaker for execution"
  value       = module.iam.sagemaker_execution_role_arn
}

# --------------------------
# SageMaker Pipeline & Endpoint
# --------------------------
output "sagemaker_pipeline_arn" {
  description = "ARN of the SageMaker pipeline"
  value       = module.sagemaker.pipeline_arn
}

output "sagemaker_endpoint_name" {
  description = "Name of the SageMaker endpoint"
  value       = module.sagemaker.endpoint_name
}
