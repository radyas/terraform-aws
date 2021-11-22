variable "name" {
    type = string
}

variable "owner" {
    type = string
}

variable "aws_ami" {
    type = string
}

variable "aws_instance_type" {
    type = string
}

variable "security_group_name" {
    type = string
}

variable "aws_public_key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAnX3R3lwVK7LQRF/6Tmq8ixeto2EHCeS8TCqEeDE3eRVi/ZUb9J7sM13E1teIbFamFWn4iiWWvxAgtoMFgI/XCtlzxGA0wMwiV48wZH77btOWZN9v51+vqrUiD4xigtoE4BeX5TuEqr6hmrvE7q0JrscvPC2lMNS8ow2cmSdxdpq/CEy4U9R1vQE26tjlHY3A0M14j5auUHnrCNGP6zzBZicx4ZX1viQYcowo9foZAdE8ujkd4ZLEUzy04oXldG3siQ04cMvRHZ2RYiVFYqc7JaXMopCSS+tt0bIvKY0TkkuhJvWYjJ1NhhrlCfzIsTdobkbYgCaTugE4Pp/1+6pPJw== ec2-user"
}