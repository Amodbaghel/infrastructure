variable "name" {
  description = "The name tag for the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID used to launch the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance (e.g., t2.micro, t3.small)"
  type        = string
}

variable "region" {
  description = "region name"
  type        = string
}
