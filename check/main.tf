# Provider configuration
provider "aws" {
  region = var.region
}

# VPC Configuration
resource "aws_vpc" "studentvpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

# Primary Subnet in ap-south-1a
resource "aws_subnet" "studentsubnet_a" {
  vpc_id            = aws_vpc.studentvpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "ap-south-1a"

  tags = {
    Name = var.subnet_name
  }
}

# Secondary Subnet in ap-south-1b for RDS requirements
resource "aws_subnet" "studentsubnet_b" {
  vpc_id            = aws_vpc.studentvpc.id
  cidr_block        = "10.0.2.0/24"   # Different CIDR block for second subnet
  availability_zone = "ap-south-1b"

  tags = {
    Name = "StudentAppSubnetB"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "studentinternetgateway" {
  vpc_id = aws_vpc.studentvpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# Security Group for EC2 and RDS
resource "aws_security_group" "studentsecuritygroup" {
  vpc_id = aws_vpc.studentvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

# EC2 Instance
resource "aws_instance" "studentapp" {
  ami                    = var.ami
  instance_type          = var.instance_type
  associate_public_ip_address = var.associate_public_ip
  key_name               = var.key_name
  subnet_id              = aws_subnet.studentsubnet_a.id
  security_groups        = [aws_security_group.studentsecuritygroup.name]

  tags = {
    Name = var.instance_name
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install openjdk-11-jre-headless -y maven
    git clone https://github.com/Aamantamboli/Studentapp.git /home/ubuntu/Studentapp
    cd /home/ubuntu/Studentapp
    mvn clean package
    cd /tmp
    wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz
    tar -xvf apache-tomcat-9.0.96.tar.gz
    sudo mv apache-tomcat-9.0.96 /opt/tomcat
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
    export CATALINA_HOME=/opt/tomcat
    sudo cp /home/ubuntu/Studentapp/target/*.war /opt/tomcat/webapps/
    sudo cp /home/ubuntu/Studentapp/*.jar /opt/tomcat/lib/
    sudo bash /opt/tomcat/bin/catalina.sh start
  EOF
}

# DB Subnet Group for RDS Instance
resource "aws_db_subnet_group" "studentdb_subnet_group" {
  name       = "studentdb-subnet-group"
  subnet_ids = [
    aws_subnet.studentsubnet_a.id,
    aws_subnet.studentsubnet_b.id
  ]

  tags = {
    Name = "studentdb-subnet-group"
  }
}

# RDS MariaDB Instance
resource "aws_db_instance" "studentdb" {
  identifier              = var.db_instance_name
  allocated_storage       = 20
  engine                  = "mariadb"
  instance_class          = "db.t2.micro"
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.studentdb_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.studentsecuritygroup.id]
  skip_final_snapshot     = true

  tags = {
    Name = var.db_instance_name
  }
}
