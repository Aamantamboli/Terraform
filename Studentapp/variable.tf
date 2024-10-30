variable "region" {
  type = string 
  description = "The AWS region to deploy the instance"
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The VPC for the instance."
  type        = string 
  default     = "StudentAppVPC"

}
variable "subnet_name" {
  description = "The subnet for the VPC."
  type        = string 
  default     = "StudentAppSubnet"
}

variable "internet_gateway_name" {
  description = "The internet gateway for the VPC."
  type        = string
  default     = "StudentInternetGateway"
}
variable "security_group_name" {
  description = "The security group for the instance."
  type        = string 
  default     = "StudentAppSecurityGroup"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet."
  type        = string
  default     = "ap-south-1a"
}

variable "ami" {
  type = string
  description = "The AMI ID to use for the instance"
  default     = "ami-0dee22c13ea7a9a67"
}

variable "instance_type" {
  type = string
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "instance_name" {
  type = string
  description = "The name of the instance"
  default     = "StudentApp"
}

variable "associate_public_ip" {
  type        = bool
  description = "Whether to associate a public IP address with the EC2 instance"
  default     = true  
}
