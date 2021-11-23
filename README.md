# Terraform AWS Example.
AWS infrastructure management via Terraform

<br>

# User Guide 
This document will walkthrough step by step to setup the environment to run and test the code locally.

<br>

## 1. Install Terraform CLI locally 
Follow [Terraform: Getting Started Docs](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started) to install Terraform CLI.

Once the installation is complete, verify whether terraform can be accessed via CLI.

<br>

## 2. Install AWS CLI
Follow [AWS CLI installation guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) to intall AWS CLI and verfiy whether it is also accessibkle via command line.

<br>

## 3. Create AWS credentials.
Follow [AWS Identity and Access Management(IAM)](https://console.aws.amazon.com/iam/home?#/security_credentials) to create an access key to your account.

Note : `This will provide unrestricted access to your entire AWS account. It is recommended that creating a new IAM user with limited permissions and generating access keys for that user instead.`

<br>

## 4. Configure Environmental Variables.
