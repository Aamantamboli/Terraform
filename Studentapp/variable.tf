variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "this_aws_ubuntu_ami_id" {
    type = string
    description = "ami-0dee22c13ea7a9a67"
}

variable "this_aws_instance_instance_type" {
       type = string
       description= "t2.micro"
}

