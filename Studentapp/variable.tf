variable "region" {
  type = string 
  description = "The AWS region to deploy the instance"
  default     = "ap-south-1"
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
  default     = "ExampleInstance"
}
