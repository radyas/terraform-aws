terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

module "api_server" {
    source = "./modules/ec2/"
    name = var.name
    owner = var.owner
    aws_ami = var.aws_ami
    aws_instance_type = var.aws_instance_type
    security_group_name = var.security_group_name
}

module "s3_bucket" {
    source = "./modules/s3/"
    name = var.name
    owner = var.owner
    aws_s3_bucket_name = var.aws_s3_bucket_name
    aws_bucket_acl = var.aws_bucket_acl
}

