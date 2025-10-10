# VPC ID
output "vpc_id" {
  description = "The ID of the VPC created for the MLOps project"
  value       = aws_vpc.mlops_vpc.id
}

# Public Subnet IDs
output "public_subnet_ids" {
  description = "List of IDs of public subnets in the VPC"
  value       = aws_subnet.public[*].id
}

# Private Subnet IDs
output "private_subnet_ids" {
  description = "List of IDs of private subnets in the VPC"
  value       = aws_subnet.private[*].id
}

# Security Group ID for SageMaker
output "sagemaker_sg_id" {
  description = "Security group ID to attach to SageMaker resources"
  value       = aws_security_group.sagemaker_sg.id
}

# NAT Gateway ID
output "nat_gateway_id" {
  description = "NAT Gateway ID for private subnet internet access"
  value       = aws_nat_gateway.nat.id
}

# Internet Gateway ID
output "internet_gateway_id" {
  description = "Internet Gateway ID attached to the VPC"
  value       = aws_internet_gateway.mlops_igw.id
}

