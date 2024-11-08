variable "region" {
  description = "The AWS region to deploy the resources."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "subnet_a_cidr" {
  description = "CIDR block for the first subnet."
  type        = string
  }

variable "subnet_b_cidr" {
  description = "CIDR block for the second subnet."
  type        = string
}

variable "subnet_a_az" {
  description = "Availability Zone for subnet A."
  type        = string
}

variable "subnet_b_az" {
  description = "Availability Zone for subnet B."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}
