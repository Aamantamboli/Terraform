variable "this_vpc_cidr_block" {
  description = "The variable is for CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "this_vpc_name" {
  description = "The variable is for VPC name"
  type        = string
  default     = "example"
}
