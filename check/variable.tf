variable "db_username" {
  type    = string
  default = "admin"  # Set the RDS database username
}

variable "db_password" {
  type    = string
  default = "password123"  # Set a strong RDS database password
}

variable "db_name" {
  type    = string
  default = "studentdb"  # Name of the database
}

variable "instance_type" {
  type    = string
  default = "t2.micro"  # Adjust based on your requirements
}
