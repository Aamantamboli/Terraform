variable this_aws_region {
    type = string 
    default = "ap-south-1"
    description = "This variable is for aws region"
}

variable "this_aws_security_group" {
    type = list 
    default = ["awssecuritygroup" , "22" , "80" , "tcp"]
    description = "This variable is for aws security group"
}

variable "this_aws_instance" {
    type = list
    default = ["ami-0dee22c13ea7a9a67" , "t2.micro" , "true"]
    description = "This variable is for aws instance"
}
