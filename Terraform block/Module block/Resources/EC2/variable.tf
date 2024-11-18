#Instance variable
variable "this_ami" {
  description = "The variable is for AMI ID for EC2 instance"
  type        = string
}

variable "this_instance_type" {
  description = "The variable is for EC2 instance type"
  type        = string
}

variable "this_associate_public_ip" {
  description = "Whether to associate a public IP with the EC2 instance"
  type        = bool
}

variable "this_subnet_id" {
  description = "The variable is for subnet id"
  type        = string
}

variable "this_security_group" {
  description = "The variable is for security group"
  type        = string
}

variable "this_key_name" {
  description = "The variable is for Name of the SSH key pair"
  type        = string
}

variable "this_instance_name" {
  description = "The variable is for Name of the instance"
  type        = string
}



