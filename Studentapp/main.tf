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

resource "aws_internet_gateway" "studentinternetgateway" {
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

resource "aws_instance" "studentapp" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name = var.instance_name
  }

user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install openjdk-11-jre-headless -y maven
              sudo apt install mariadb-client -y

              # Clone the repository
              git clone https://github.com/Aamantamboli/Studentapp.git /home/ubuntu/Studentapp
              # Navigate to the project directory and build it
              cd /home/ubuntu/Studentapp
              mvn clean package

              # Download and install Tomcat
              cd /tmp
              wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz  #Check for new version if doesnt work
              tar -xvf apache-tomcat-9.0.97.tar.gz
              sudo mv apache-tomcat-9.0.97 /opt/tomcat

              # Set JAVA_HOME
              export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
              export CATALINA_HOME=/opt/tomcat

              # Copy the built artifacts to Tomcat's webapps directory
              sudo cp /home/ubuntu/Studentapp/target/*.war /opt/tomcat/webapps/
              sudo cp /home/ubuntu/Studentapp/*.jar /opt/tomcat/lib/

              # Start Tomcat
              sudo bash /opt/tomcat/bin/catalina.sh start
              EOF
}
