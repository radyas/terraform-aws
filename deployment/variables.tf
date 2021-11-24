variable "name" {
    type = string
    default = "Flugel"
}

variable "owner" {
    type = string
    default = "InfraTeam"
}

variable "aws_profile" {
    type = string
    default = "default"
}

variable "aws_region" {
    type = string
    default = "us-west-2"
}

variable "aws_ami" {
    type = string
    default = "ami-024221a59c9020e72"
}

variable "aws_instance_type" {
    type = string
    default = "t2.micro"
}

variable "aws_s3_bucket_name" {
    type = string
    default = "bucket-01"
}

variable "aws_bucket_acl" {
    type = string
    default = "private"
}

variable "aws_access_key" {
    type = string
}

variable "aws_secret_key" {
    type = string
}

variable "security_group_name" {
    type = string
    default = "security-group-01"
}