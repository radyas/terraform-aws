resource "aws_s3_bucket" "test_bucket" {
    bucket = "${var.aws_s3_bucket_name}"
    acl = var.aws_bucket_acl
    tags = {
      "Name" = var.name
      "Owner" = var.owner
    }
}