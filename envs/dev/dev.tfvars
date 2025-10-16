
region = "us-east-1"

bucket_name      = "mlops-project-artifacts-dev"
bucket_ownership = "BucketOwnerPreferred"
bucket_acl       = "private"

role_name   = "mlops-sagemaker-role-dev"
policy_name = "sagemaker-full-access-policy"

pipeline_name         = "mlops-pipeline-dev"
pipeline_display_name = "MLOps Pipeline Dev"
existing_model_name   = "mlops-model-dev"

endpoint_config_name = "mlops-endpoint-config-dev"
endpoint_name        = "mlops-endpoint-dev"
instance_type        = "ml.m5.large"
instance_count       = 1
