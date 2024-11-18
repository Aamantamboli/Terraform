variable "this_ami" {
  description = "The variable is for AMI ID for EC2 instance"
  type        = string
  default     = "ami-0dee22c13ea7a9a67"
}

variable "this_instance_type" {
  description = "The variable is for EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "this_associate_public_ip" {
  description = "Whether to associate a public IP with the EC2 instance"
  type        = bool
  default     = true
}

variable "this_instance_name" {
  description = "The variable is for Name of the instance"
  type        = string
  default     = "StudentApp"
}

variable "this_key_name" {
  description = "The variable is for Name of the SSH key pair"
  type        = string
  default     = "mynewaaman"
}
