variable "region" {
  description = "AWS region to deploy SageMaker resources"
  type        = string
}

variable "role_arn" {
  description = "IAM Role ARN for SageMaker execution"
  type        = string
}

# Pipeline variables
variable "pipeline_name" {
  description = "Name of the SageMaker pipeline"
  type        = string
}

variable "pipeline_display_name" {
  description = "Display name for the SageMaker pipeline"
  type        = string
}

# Existing SageMaker Model
variable "existing_model_name" {
  description = "Name of the already deployed SageMaker model"
  type        = string
}

# Endpoint configuration variables
variable "endpoint_config_name" {
  description = "Name of the SageMaker endpoint configuration"
  type        = string
}

variable "endpoint_name" {
  description = "Name of the SageMaker endpoint"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for endpoint"
  type        = string
}

variable "instance_count" {
  description = "Number of instances for endpoint"
  type        = number
}
