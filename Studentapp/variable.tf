variable "region" {
  description = "The AWS region to deploy the instance"
  default     = "ap-south-1"
}

variable "ami" {
  description = "The AMI ID to use for the instance"
  default     = "ami-0dee22c13ea7a9a67"
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The name of the instance"
  default     = "ExampleInstance"
}
