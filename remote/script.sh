#!/bin/sh
ssh -T -o StrictHostKeyChecking=no -i private.pem ec2-user@"$1" << 'EOL'
    sudo yum update
    sudo yum install -y git
    git clone -b dev https://github.com/radyas/terraform-aws.git
    aws configure << "$2\$3"
    cd terraform-aws/api
    pip3 install -r requirements.txt
    bash
    gunicorn app:app --bind 0.0.0.0:5000 --daemon
EOL