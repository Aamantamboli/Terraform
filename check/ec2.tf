resource "aws_instance" "app_server" {
  ami           = "ami-0dee22c13ea7a9a67"  # Use the Ubuntu AMI ID for your region
  instance_type = var.instance_type
  key_name      = "mynewaaman"  # Replace with your key pair name

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

              # Configure the database connection
              cat <<EOL > /opt/tomcat/conf/context.xml
              <Context>
                  <Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource"
                            maxTotal="100" maxIdle="30" maxWaitMillis="10000"
                            username="${var.db_username}" password="${var.db_password}" driverClassName="com.mysql.jdbc.Driver"
                            url="jdbc:mysql://${aws_db_instance.student_db.endpoint}/${var.db_name}"/>
              </Context>
              EOL

              # Copy the built artifacts to Tomcat's webapps directory
              sudo cp /home/ubuntu/Studentapp/target/*.war /opt/tomcat/webapps/
              sudo cp /home/ubuntu/Studentapp/*.jar /opt/tomcat/lib/

              # Start Tomcat
              sudo bash /opt/tomcat/bin/catalina.sh start
              EOF

  tags = {
    Name = "StudentApp-EC2"
  }

  # Configure security group for EC2
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}

resource "aws_security_group" "ec2_sg" {
  name = "ec2_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP access for Tomcat
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}