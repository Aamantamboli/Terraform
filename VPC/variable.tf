# AWS Region
variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "The variable is for aws region"
}

# VPC 
variable "this_vpc" {
  type        = list
  default     = ["10.0.0.0/16" , "true" , "my-vpc"]
  description = "The variable is for the VPC"
}

# Internet Gateway 
variable "this_internet_gateway" {
  type        = string
  default     = "my-igw"
  description = "The varaible is for Internte Gateway"
}

# Public Subnet 1 
variable "this_subnet_1" {
  type        = list
  default     = ["10.0.1.0/24" , "ap-south-1a" , "true" , "subnet-1"]
  description = "The variable is for the first public subnet"
}

# Public Subnet 2 CIDR block
variable "this_subnet_2" {
  type        = list
  default     = ["10.0.2.0/24" , "ap-south-1b , "true" , "subnet-2"]
  description = "The variable is for the second public subnet"
}

# Route Table Name
variable "this_route_table" {
  type        = string
  default     = "my-route-table"
  description = "The name of the route table"
}

