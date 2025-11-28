variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "tf-clouds"
}

variable "s3_bucket_name" {
  type    = string
  description = "S3 bucket name (must be globally unique). If blank, Terraform creates a name."
  default = ""
}

variable "s3_lifecycle_transition_days" {
  type    = number
  default = 30
  description = "Days after which objects transit to Glacier Deep Archive (adjust)"
}

variable "s3_expiration_days" {
  type    = number
  default = 365
  description = "Days after which objects expire"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

