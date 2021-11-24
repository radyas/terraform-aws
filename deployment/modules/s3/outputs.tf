output "s3_owner" {
  value = aws_s3_bucket.test_bucket.tags.Owner
}

output "s3_name" {
  value = aws_s3_bucket.test_bucket.tags.Name
}
