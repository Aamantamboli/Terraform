# AWS Region
variable "this_aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-1"
}

# VPC CIDR block
variable "this_vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# VPC Name
variable "this_vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

# Internet Gateway Name
variable "this_igw_name" {
  description = "The name of the Internet Gateway"
  type        = string
  default     = "my-igw"
}

# Public Subnet 1 CIDR block
variable "this_subnet_1_cidr_block" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Public Subnet 1 Availability Zone
variable "this_subnet_1_az" {
  description = "The availability zone for the first public subnet"
  type        = string
  default     = "ap-south-1a"
}

# Public Subnet 1 Name
variable "this_subnet_1_name" {
  description = "The name of the first public subnet"
  type        = string
  default     = "subnet-1"
}

# Public Subnet 2 CIDR block
variable "this_subnet_2_cidr_block" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Public Subnet 2 Availability Zone
variable "this_subnet_2_az" {
  description = "The availability zone for the second public subnet"
  type        = string
  default     = "ap-south-1b"
}

# Public Subnet 2 Name
variable "this_subnet_2_name" {
  description = "The name of the second public subnet"
  type        = string
  default     = "subnet-2"
}

# Route Table Name
variable "this_route_table_name" {
  description = "The name of the route table"
  type        = string
  default     = "my-route-table"
}