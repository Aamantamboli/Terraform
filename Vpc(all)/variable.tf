variable "this_vpc_cidr_block" {
    type = string
    default = "12.11.0.0/16"
    description = "The variable is for vpc cidr block"
}

variable "this_vpc_tags" {
    type = string
    default = "examplevpc"
    description = "The variable is for tag of vpc"
}

variable "this_subnet_pub_cidr_block" {
    type = string
    default = "12.11.0.0/17"
    description = "The variable is for subnet cidr block"
} 

variable "this_subnet_pub_map_ip" {
    type = bool
    default = true
    description = "The variable is for subnet map ip"
}

variable "this_subnet_pub_tags" {
    type = string
    default = "pub_subnet"
    description = "The variable is for tag of subnet"
}

variable "this_ami" {
    type = string
    default = "ami-0dee22c13ea7a9a67"
    description = "This variable is for aws ami"
}

variable "this_instance_type" {
    type = list
    default = ["t2.micro" , "t3.small" , "t3.large"]
    description = "This variable is for aws instance type"
}

variable "this_key_pair " {
    type = string
    default = "mynewaaman"
    description = "This variable is for aws key pair"
}

variable "this_security_group" {
    type = string
    default = "sg-043784a83b52774ca"
    description = "This variable is for aws security group" 
}