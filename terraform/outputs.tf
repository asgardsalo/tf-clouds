output "s3_bucket_name" {
  value = aws_s3_bucket.main.bucket
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_id" {
  value = aws_subnet.this.id
}

output "security_group_id" {
  value = aws_security_group.app_sg.id
}

output "sample_s3_object_url" {
  value = "s3://${aws_s3_bucket.main.bucket}/${aws_s3_bucket_object.sample.key}"
}

