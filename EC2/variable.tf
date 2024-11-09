variable this_aws_region {
    type = string 
    default = "ap-south-1"
    description = "This variable is for aws region"
}

variable "this_aws_ami" {
    type = string
    default = "ami-0dee22c13ea7a9a67"
    description = "This variable is for aws ami"
}

variable "this_aws_instance_type" {
    type = list
    default = ["t2.micro" , "t3.small" , "t3.large"]
    description = "This variable is for aws instance type"
}

variable "this_aws_key_pair " {
    type = string
    default = "mynewaaman"
    description = "This variable is for aws key pair"
}

variable "this_aws_associate_public_ip" {
    type = bool
    default = true 
    description = "This variable is for aws assoociate public ip address"
}

variable "this_aws_tag" {
    type = map 
    default = {
        Name1 = "ExampleInstance"
        Name2 = "NewInstance"
    }
    description = "This variable is for aws instance tagging"
}

variable "this_aws_security_group" {
    type = string
    default = "sg-043784a83b52774ca"
    description = "This variable is for aws security group" 
}