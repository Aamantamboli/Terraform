variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0dee22c13ea7a9a67"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "StudentApp"
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = "student-sg"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "student-vpc"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "student-subnet"
}

variable "internet_gateway_name" {
  description = "Internet Gateway name"
  type        = string
  default     = "student-igw"
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP with the EC2 instance"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "mynewaaman"
}
