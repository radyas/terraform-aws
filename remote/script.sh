#!/bin/sh
ssh -T -o StrictHostKeyChecking=no -i private.pem ec2-user@"$1" << 'EOL'
    sudo yum update
    sudo yum install -y git
    git clone -b dev https://github.com/radyas/terraform-aws.git
    aws configure set aws_access_key_id "$2"
    aws configure set aws_secret_access_key "$3"
    aws configure set default.region us-west-2
    cd terraform-aws/api
    pip3 install -r requirements.txt
    bash
    flask run --host 0.0.0.0
EOL