output "pipeline_arn" {
  description = "ARN of the SageMaker pipeline"
  value       = aws_sagemaker_pipeline.example.arn
}

output "endpoint_config_name" {
  description = "SageMaker endpoint configuration name"
  value       = aws_sagemaker_endpoint_configuration.example.name
}

output "endpoint_name" {
  description = "SageMaker endpoint name"
  value       = aws_sagemaker_endpoint.example.name
}
