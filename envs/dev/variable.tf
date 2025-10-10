# --------------------------
# AWS Region
# --------------------------
variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

# --------------------------
# VPC Configuration
# --------------------------
variable "vpc_name" {
  description = "Name of the VPC to create/use"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "allowed_ip" {
  description = "IP address or CIDR allowed for access (e.g., SSH, security groups)"
  type        = string
}

# --------------------------
# S3 Bucket Configuration
# --------------------------
variable "bucket_name" {
  description = "Name of the S3 bucket for SageMaker artifacts"
  type        = string
}

variable "bucket_ownership" {
  description = "S3 bucket ownership setting (e.g., 'BucketOwnerPreferred')"
  type        = string
}

variable "bucket_acl" {
  description = "S3 bucket ACL (e.g., 'private', 'public-read')"
  type        = string
}

# --------------------------
# IAM Role and Policy
# --------------------------
variable "role_name" {
  description = "Name of the IAM role to create for SageMaker"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy to attach to the SageMaker role"
  type        = string
  default     = "sagemaker-full-access-policy"
}

# --------------------------
# SageMaker Pipeline
# --------------------------
variable "pipeline_name" {
  description = "Name of the SageMaker pipeline"
  type        = string
}

variable "pipeline_display_name" {
  description = "Display name of the SageMaker pipeline"
  type        = string
}

# --------------------------
# SageMaker Endpoint
# --------------------------
variable "existing_model_name" {
  description = "Name of the already deployed SageMaker model"
  type        = string
}

variable "endpoint_config_name" {
  description = "Name of the SageMaker endpoint configuration"
  type        = string
}

variable "endpoint_name" {
  description = "Name of the SageMaker endpoint"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for SageMaker endpoint (e.g., ml.m5.large)"
  type        = string
}

variable "instance_count" {
  description = "Number of instances for the SageMaker endpoint"
  type        = number
}
