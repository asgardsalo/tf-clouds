resource "aws_s3_bucket_object" "sample" {
  bucket = aws_s3_bucket.main.bucket
  key    = "sample_files/sample.txt"
  source = "${path.module}/sample_files/sample.txt"
  etag   = filemd5("${path.module}/sample_files/sample.txt")
}

