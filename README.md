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
Created AWS credentials needs to be added as environment variables. Repository uses `AWS_ACCESS_KEY` and `AWS_SECRET_KEY` for access key and secret key respectively.

<br>

## 5. Initialize Terraform
Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.

    terraform init

## 6. Generate Plan
Generates a named execution plan for Terraform. To provide variables we use a separate file called `dev.tfvars`. We include it when creating the plan.

    terraform plan -var-file="dev.tfvars" -out="plan"

## 7. Apply Plan
By applying, this will deploy the infrastructure as given.

    terraform apply -auto-approve "plan"

## 8. Deployment Script
Goto `remote` directory and execute the script with host name, aws access key, aws secret key respectively. Private key should also present in the `remote` directory.
    
    chmod +x script.sh
    ./script.sh <host> <access_key> <secret_key>

## 9. Validate Endpoints
By applying, this will deploy the infrastructure as given.

    python app.py

<br>

# Test Guide
Follow this guideline to run tests.

Follow steps one to four to configure prerequisites if not already finished.


## 1. Install GO
Follow [official documentation](https://go.dev/doc/install). Install and verify the installation.

## 2. Run Test
Go to test folder and run

    go test-v





    