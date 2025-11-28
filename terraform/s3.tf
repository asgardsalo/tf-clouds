# Create S3 bucket
resource "aws_s3_bucket" "main" {
  bucket = local.bucket_name
  acl    = "private"

  tags = {
    Name    = local.bucket_name
    Project = var.project
  }

  force_destroy = false
}

# Versioning (recommended for state recovery)
resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Lifecycle rule: transition to Glacier Deep Archive, then expire
resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    id     = "archive-and-expire"
    status = "Enabled"

    filter {
      prefix = ""   # all objects
    }

    transition {
      days          = var.s3_lifecycle_transition_days
      storage_class = "GLACIER"
    }

    expiration {
      days = var.s3_expiration_days
    }

    noncurrent_version_expiration {
      days = var.s3_expiration_days
    }
  }
}


