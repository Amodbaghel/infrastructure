# --------------------------
# VPC Outputs
# --------------------------
output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs created in the VPC"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs created in the VPC"
  value       = module.vpc.private_subnet_ids
}

output "sagemaker_sg_id" {
  description = "Security group ID used by SageMaker"
  value       = module.vpc.sagemaker_sg_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

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
