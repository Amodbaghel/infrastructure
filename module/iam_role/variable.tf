variable "role_name" {
  description = "Name of the SageMaker IAM Role"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket for SageMaker artifacts"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy for SageMaker"
  type        = string
  default     = "sagemaker-full-access-policy"
}
