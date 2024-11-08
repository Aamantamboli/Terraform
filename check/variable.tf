# AWS Region Configuration
variable "region" {
  type        = string 
  description = "The AWS region to deploy the resources."
  default     = "ap-south-1"
}

# VPC Configuration
variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string 
  description = "The name of the VPC."
  default     = "StudentAppVPC"
}

# Subnet Configuration
variable "subnet_name" {
  type        = string 
  description = "The name of the subnet within the VPC."
  default     = "StudentAppSubnet"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block for the subnet."
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone for the subnet."
  default     = "ap-south-1a"
}

# Internet Gateway Configuration
variable "internet_gateway_name" {
  type        = string
  description = "The name of the internet gateway for the VPC."
  default     = "StudentInternetGateway"
}

# Security Group Configuration
variable "security_group_name" {
  type        = string 
  description = "The name of the security group to be used by the EC2 instance."
  default     = "StudentAppSecurityGroup"
}

# EC2 Instance Configuration
variable "ami" {
  type        = string
  description = "The AMI ID to use for the EC2 instance."
  default     = "ami-0dee22c13ea7a9a67"  # Replace with the AMI of your choice
}

variable "instance_type" {
  type        = string
  description = "The type of instance to create."
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "The name of the EC2 instance."
  default     = "StudentApp"
}

variable "associate_public_ip" {
  type        = bool
  description = "Whether to associate a public IP address with the EC2 instance."
  default     = true
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for the EC2 instance SSH access."
  default     = "mynewaaman"  # Replace with your key pair name
}

# Database Configuration for MariaDB RDS Instance
variable "db_name" {
  type        = string
  description = "The name of the database to create in RDS."
  default     = "studentdb"
}

variable "db_username" {
  type        = string
  description = "The master username for the RDS database."
  default     = "admin"
}

variable "db_password" {
  type        = string
  description = "The master password for the RDS database."
  default     = "yourpassword"  # Replace with a secure password
  sensitive   = true
}

variable "db_instance_name" {
  type        = string
  description = "The name tag for the RDS database instance."
  default     = "studentappinstance"
}
