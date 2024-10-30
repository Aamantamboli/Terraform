provider "aws" {
  region = var.region
}

resource "aws_vpc" "studentvpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "studentsubnet" {
  vpc_id            = aws_vpc.studentvpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.studentvpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

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

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name = var.instance_name
  }
}

user_data = <<-EOF
              #!/bin/bash
              # Update the package repository
              sudo apt update -y

              # Install Java and Maven
              sudo apt install openjdk-11-jre-headless -y maven

              # Clone the repository
              git clone https://github.com/Aamantamboli/Studentapp.git /home/ubuntu/Studentapp

              # Navigate to the project directory and build it
              cd /home/ubuntu/Studentapp
              mvn clean package

              # Download and install Tomcat
              cd /tmp
              wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.96/bin/apache-tomcat-9.0.96.tar.gz
              tar -xvf apache-tomcat-9.0.96.tar.gz
              sudo mv apache-tomcat-9.0.96 /opt/tomcat

              # Copy the built artifacts to Tomcat's webapps directory
              sudo cp /home/ubuntu/Studentapp/target/*.war /opt/tomcat/webapps/

              # Start Tomcat
              sudo bash /opt/tomcat/bin/catalina.sh start
              EOF
}
