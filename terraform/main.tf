locals {
  name_prefix = "${var.project}"
  bucket_name = var.s3_bucket_name != "" ? var.s3_bucket_name : "${local.name_prefix}-${random_id.bucket_id.hex}"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
