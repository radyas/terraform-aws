output "server_url"{
    value = module.api_server.public_dns
}

output "ec2_instance_tags_name"{
    value = module.api_server.ec2_name
}

output "ec2_instance_tags_owner"{
    value = module.api_server.ec2_owner
}

output "s3_bucket_tags_name"{
    value = module.s3_bucket.s3_name
}

output "s3_bucket_tags_owner"{
    value = module.s3_bucket.s3_owner
}