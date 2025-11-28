terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  # Optional: Uncomment and configure to use a remote S3 backend
  # backend "s3" {
  #   bucket = "tf-state-your-bucket"
  #   key    = "tf-clouds/terraform.tfstate"
  #   region = "us-east-1"
  # }
}
