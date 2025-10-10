terraform {
  cloud {
    organization = "your-tfc-organization-name" # 👈 Replace this with your Terraform Cloud organization name

    workspaces {
      name = "mlops-infra-dev" # 👈 Terraform Cloud workspace name
    }
  }

  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}
