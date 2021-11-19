output "ec2_name" {
  value = aws_instance.api_server.tags.Name
}

output "ec2_owner" {
  value = aws_instance.api_server.tags.Owner
}

output "public_dns" {
  value = aws_instance.api_server.public_dns
}
