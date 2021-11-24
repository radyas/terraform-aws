resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = var.aws_public_key
}

resource "aws_instance" "api_server" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type
  security_groups = [ var.security_group_name ]
  key_name = aws_key_pair.ssh-key.key_name

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
    from_port = 5000
    protocol = "tcp"
    to_port = 5000
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow SSH
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
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
