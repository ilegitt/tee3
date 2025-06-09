variable "aws_region" {
  description = "AWS region used by Terraform"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.db_password) >= 8
    error_message = "The db_password must be at least 8 characters long."
  }
}


variable "app_user_password" {
  description = "Password for application DB user (stored in Secrets Manager)"
  type        = string
  sensitive   = true
}
