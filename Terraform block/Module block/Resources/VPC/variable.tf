#VPC variable
variable "this_vpc_cidr_block" {
  description = "The variable is for CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "this_enable_dns_support" {
  description = "The variable is for enable dns support"
  type        = bool
}

variable "this_enable_dns_hostnames" {
  description = "The variable is for enable dns hostnames"
  type        = bool
}

variable "this_vpc_name" {
  description = "The variable is for VPC name"
  type        = string
  default     = "exmaplevpc"
}

#Subnet variable
variable "this_subnet_cidr_block" {
  description = "The variable is for CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "this_availability_zone" {
  description = "The variable is for Availability zone for the subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "this_map_public_ip_on_launch" {
  description = "The variable is for map publin on launch"
  type        = bool
}

variable "this_subnet_name" {
  description = "The variable is for Subnet name"
  type        = string
  default     = "examplesubnet"
}

#IGW variable
variable "this_internet_gateway_name" {
  description = "The variable is for Internet Gateway name"
  type        = string
  default     = "exampleigw"
}

#RT variable
variable "this_route_table_name" {
  description = "The variable is for Route table name" 
  type        = string
}

#SG variable
variable "this_security_group_name" {
  description = "The variable is for Security group name"
  type        = string
  default     = "examplesg"
}