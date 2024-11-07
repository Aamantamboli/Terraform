provider "aws" {
  profile = var.this_aws_profile
  region  = var.this_aws_region
}

# Oracle RDS Instance
resource "aws_db_instance" "oracle_db" {
  identifier              = var.this_db_identifier
  allocated_storage       = var.this_db_allocated_storage
  engine                  = "oracle-se2"       # Or "oracle-se1", "oracle-ee" depending on your needs
  instance_class          = var.this_db_instance_class
  db_name                 = var.this_db_name
  username                = var.this_db_username
  password                = var.this_db_password
  parameter_group_name    = var.this_db_parameter_group
  license_model           = "license-included"  # or "bring-your-own-license"
  skip_final_snapshot     = true
  publicly_accessible     = var.this_publicly_accessible
  backup_retention_period = var.this_backup_retention_period

  # Optional: Multi-AZ setup
  multi_az = var.this_multi_az
}

# Output database endpoint
output "db_endpoint" {
  value = aws_db_instance.oracle_db.endpoint
}

output "db_arn" {
  value = aws_db_instance.oracle_db.arn
}