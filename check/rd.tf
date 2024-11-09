resource "aws_db_instance" "mariadb_instance" {
  identifier              = "my-mariadb-instance"  # Customize this name
  engine                  = "mariadb"
  engine_version          = "10.5"                # Specify the desired MariaDB version
  instance_class          = "db.t3.micro"         # Choose an appropriate instance type
  allocated_storage       = 20                    # Storage size in GB
  storage_type            = "gp2"                 # General-purpose SSD storage
  db_name                 = "mydatabase"          # Name of the database
  username                = "admin"               # Master username
  password                = "yourpassword"        # Master password (keep it secure)
  publicly_accessible     = false                 # Set to true if you want public access
  skip_final_snapshot     = true                  # Skips snapshot on deletion for testing
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
