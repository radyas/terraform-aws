resource "aws_instance" "api_server" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type
  security_groups = [ var.security_group_name ]

  tags = {
    Name = var.name
    Owner = var.owner
  }
}

resource "aws_security_group" "flugel-ec2-sg-1" {
  name = var.security_group_name
  description = "Security group for the EC2 instance"

  // To Allow Web Server to Transport
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
