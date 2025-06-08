variable "aws_region" {
  description = "AWS region used by Terraform"
  type        = string
  default     = "us-west-2"
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
  description = "RDS master password (stored in Secrets Manager)"
  type        = string
  sensitive   = true
}

variable "app_user_password" {
  description = "Password for application DB user (stored in Secrets Manager)"
  type        = string
  sensitive   = true
}
