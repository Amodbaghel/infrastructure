# Data source for availability zones
data "aws_availability_zones" "available" {}

# VPC
resource "aws_vpc" "mlops_vpc" {
  cidr_block = var.cidr_block
  tags = {
  Name = var.vpc_name }
}

# Internet Gateway
resource "aws_internet_gateway" "mlops_igw" {
  vpc_id = aws_vpc.mlops_vpc.id
  tags   = { Name = "${var.vpc_name}-igw" }
}

# Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.mlops_vpc.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  tags                    = { Name = "${var.vpc_name}-public-${count.index}" }
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.mlops_vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags              = { Name = "${var.vpc_name}-private-${count.index}" }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.mlops_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mlops_igw.id
  }
  tags = { Name = "${var.vpc_name}-public-rt" }
}

# Associate public subnets
resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "nat" {

  tags = {
    Name = "${var.vpc_name}-nat-eip"
  }
}


# NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags          = { Name = "${var.vpc_name}-nat" }
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.mlops_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = { Name = "${var.vpc_name}-private-rt" }
}

# Associate private subnets
resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

# Security Group for SageMaker
resource "aws_security_group" "sagemaker_sg" {
  name        = "${var.vpc_name}-sagemaker-sg"
  description = "Security group for SageMaker resources"
  vpc_id      = aws_vpc.mlops_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  tags = { Name = "${var.vpc_name}-sagemaker-sg" }
}

