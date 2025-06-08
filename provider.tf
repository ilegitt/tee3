terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.9"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
