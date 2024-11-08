resource "aws_db_instance" "student_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7.44-rds.20240808" # Keep the exact version
  instance_class       = "db.t3.micro"         # Switch to a compatible instance class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true

  # Configure security group for RDS
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

resource "aws_security_group" "rds_sg" {
  name = "rds_sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust to limit access if needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
