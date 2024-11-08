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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_db_instance" "studentdb" {
  engine            = "mariadb"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
  vpc_security_group_ids = [aws_security_group.studentsecuritygroup.id]
  db_subnet_group_name   = aws_db_subnet_group.studentdb_subnet_group.name
  skip_final_snapshot    = true

  tags = {
    Name = var.db_instance_name
  }
}

resource "aws_db_subnet_group" "studentdb_subnet_group" {
  name       = "studentdb-subnet-group"
  subnet_ids = [aws_subnet.studentsubnet.id]

  tags = {
    Name = "studentdb-subnet-group"
  }
}

resource "aws_instance" "studentapp" {
  ami                    = var.ami
  instance_type          = var.instance_type
  associate_public_ip_address = var.associate_public_ip
  subnet_id              = aws_subnet.studentsubnet.id
  security_groups        = [aws_security_group.studentsecuritygroup.name]
  key_name               = var.key_name

  tags = {
    Name = var.instance_name
  }

  user_data = <<-EOF
              #!/bin/bash
              # Update the package repository
              sudo apt update -y

              # Install Java, Maven, and MariaDB client
              sudo apt install -y openjdk-11-jre-headless maven mariadb-client

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

              # Set JAVA_HOME
              export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
              export CATALINA_HOME=/opt/tomcat

              # Configure database in context.xml
              sudo tee /opt/tomcat/conf/context.xml > /dev/null <<EOT
              <Context>
                <Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource" 
                   maxTotal="100" maxIdle="30" maxWaitMillis="10000"
                   username="${var.db_username}" password="${var.db_password}" driverClassName="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://${aws_db_instance.studentdb.endpoint}:3306/${var.db_name}"/>
              </Context>
              EOT

              # Initialize the database
              mysql -h ${aws_db_instance.studentdb.endpoint} -u ${var.db_username} -p${var.db_password} -e "
              CREATE DATABASE IF NOT EXISTS ${var.db_name};
              USE ${var.db_name};
              CREATE TABLE IF NOT EXISTS students (
                student_id INT NOT NULL AUTO_INCREMENT,
                student_name VARCHAR(100) NOT NULL,
                student_addr VARCHAR(100) NOT NULL,
                student_age VARCHAR(3) NOT NULL,
                student_qual VARCHAR(20) NOT NULL,
                student_percent VARCHAR(10) NOT NULL,
                student_year_passed VARCHAR(10) NOT NULL,
                PRIMARY KEY (student_id)
              );"

              # Copy the built artifacts to Tomcat's webapps directory
              sudo cp /home/ubuntu/Studentapp/target/*.war /opt/tomcat/webapps/

              # Start Tomcat
              sudo bash /opt/tomcat/bin/catalina.sh start
  EOF
}
