variable "thi_aws_profile" {
  description = "AWS profile to use"
  type        = string
  default     = "default"
}

variable "thi_aws_region" {
  description = "AWS region for RDS instance"
  type        = string
  default     = "ap-south-1"
}

variable "this_db_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "my-oracle-db"
}

variable "this_db_allocated_storage" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}

variable "this_db_instance_class" {
  description = "DB instance class"
  type        = string
  default     = "db.t3.medium"
}

variable "this_db_name" {
  description = "Database name"
  type        = string
  default     = "mydb"
}

variable "this_db_username" {
  description = "Master username"
  type        = string
  default     = "admin"
}

variable "this_db_password" {
  description = "Master password"
  type        = string
}

variable "this_db_parameter_group" {
  description = "RDS parameter group for Oracle"
  type        = string
  default     = "default.oracle-se2-19"  # Adjust as needed based on the Oracle engine version
}

variable "this_publicly_accessible" {
  description = "If true, the RDS instance will be publicly accessible"
  type        = bool
  default     = false
}

variable "this_backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "this_multi_az" {
  description = "If true, RDS instance will be deployed in multiple availability zones"
  type        = bool
  default     = false
}