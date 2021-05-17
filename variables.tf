variable "aws_project" {
  type        = string
  description = "My project name"
}

variable "aws_region" {
  type        = string
  description = "AWS deployment region"
}

variable "aws_profile" {
  type        = string
  description = "AWS credentials profile"
}

variable "project_tags" {
  description = ""
  type        = map(string)
}

variable "s3_bucket_name" {
  description = "S3 bucket name for the Terraform state"
  type        = string
}


variable "dynamodb_name" {
  description = "DynamoDB Table for Terraform state"
  type        = string
}
