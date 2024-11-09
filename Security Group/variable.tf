variable "this_aws_security_group" {
    type = list 
    default = ["awssecuritygroup" , "22" , "80" , "tcp"]
    description = "The variable is for aws security group"
}

variable "this_aws_security_group_name" {
    type = string 
    default = "examplesecuritygroup"
    description = "The variable is for aws security group name"
}

variable "this_aws_security_group_port" {
    type = list
    default = ["22" , "80"]
    description = "The variable is for aws security group port" 
}

variable "this_aws_security_group_protocol" {
    type = string
    default = "tcp"
    description = "The variable is for aws security group protocol"
}