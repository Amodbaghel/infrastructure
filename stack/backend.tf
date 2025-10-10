terraform {
  cloud {
    organization = "Trading-lab" # 👈 apne TFC org ka naam
    workspaces {
      name = "infrastructure" # 👈 workspace ka naam jahan apply chalega
    }
  }

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
