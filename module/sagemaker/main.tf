
resource "aws_sagemaker_pipeline" "example" {
  pipeline_name         = var.pipeline_name
  pipeline_display_name = var.pipeline_display_name
  role_arn              = var.role_arn

  pipeline_definition = jsonencode({
    Version = "2020-12-01"
    Steps = [
      {
        Name = "TestStep"
        Type = "Fail"
        Arguments = {
          ErrorMessage = "This is a test step"
        }
      }
    ]
  })
}

# SageMaker Endpoint Configuration using existing model
resource "aws_sagemaker_endpoint_configuration" "example" {
  name = var.endpoint_config_name

  production_variants {
    variant_name           = "AllTraffic"
    model_name             = var.existing_model_name # Existing model in AWS
    initial_instance_count = var.instance_count
    instance_type          = var.instance_type
  }
}

# SageMaker Endpoint
resource "aws_sagemaker_endpoint" "example" {
  name                 = var.endpoint_name
  endpoint_config_name = aws_sagemaker_endpoint_configuration.example.name

  tags = {
    Name = "SageMakerEndpoint"
  }
}

