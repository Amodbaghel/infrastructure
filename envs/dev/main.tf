
module "vpc" {
  source          = "../../modules/vpc"
  vpc_name        = var.vpc_name
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  allowed_ip      = var.allowed_ip
  region          = var.region
}

module "s3" {
  source    = "../../modules/s3"
  name      = var.bucket_name
  ownership = var.bucket_ownership
  acl       = var.bucket_acl
}

module "iam" {
  source        = "../../modules/iam"
  role_name     = var.role_name
  s3_bucket_arn = module.s3.s3_bucket_arn
  policy_name   = var.policy_name
}

module "sagemaker" {
  source                = "../../modules/sagemaker"
  region                = var.region
  role_arn              = module.iam.sagemaker_execution_role_arn
  pipeline_name         = var.pipeline_name
  pipeline_display_name = var.pipeline_display_name
  existing_model_name   = var.existing_model_name
  endpoint_config_name  = var.endpoint_config_name
  endpoint_name         = var.endpoint_name
  instance_type         = var.instance_type
  instance_count        = var.instance_count
}
