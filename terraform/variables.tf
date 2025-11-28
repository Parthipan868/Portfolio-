variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for portfolio website (must be globally unique)"
  type        = string
  default     = "portfolio-static-website-unique-name"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}
