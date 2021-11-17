resource "aws_instance" "api_server" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type

  tags = {
    Name = var.name
    Owner = var.owner
  }
}


resource "aws_s3_bucket" "test_bucket" {
    bucket = var.aws_s3_bucket_name
    acl = var.aws_bucket_acl
    tags = {
      "Name" = var.name
      "Owner" = var.owner
    }
}