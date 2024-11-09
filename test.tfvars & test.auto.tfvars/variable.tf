variable this_aws_region {
    type = string 
    description = "This variable is for aws region"
}

variable "this_aws_ami" {
    type = string
    description = "This variable is for aws ami"
}

variable "this_aws_instance_type" {
    type = list
    description = "This variable is for aws instance type"
}

variable "this_aws_key_pair" {
    type = string 
    description = "This variable is for aws key pair"
}

variable "this_aws_associate_public_ip" {
    type = bool
    description = "This variable is for aws assoociate public ip address"
}

variable "this_aws_tag" {
    type = map 
    description = "This variable is for aws instance tagging"
}

variable "this_aws_security_group" {
    type = string
    description = "This variable is for aws security group" 
}