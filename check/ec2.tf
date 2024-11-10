resource "aws_instance" "app_server" {
  ami           = "ami-0dee22c13ea7a9a67"  # Ubuntu AMI ID for your region
  instance_type = var.instance_type
  key_name      = "mynewaaman"  # Replace with your key pair name

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install openjdk-11-jre-headless -y maven mariadb-client -y

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

    # Configure the database connection for Tomcat
    cat <<EOL > /opt/tomcat/conf/context.xml
    <Context>
        <Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource"
                  maxTotal="100" maxIdle="30" maxWaitMillis="10000"
                  username="${var.db_username}" password="${var.db_password}" driverClassName="com.mysql.jdbc.Driver"
                  url="jdbc:mysql://${aws_db_instance.student_db.endpoint}/${var.db_name}"/>
    </Context>
    EOL

    # Create the students table in the database
    mysql -h ${aws_db_instance.student_db.endpoint} -u ${var.db_username} -p${var.db_password} -D ${var.db_name} <<EOF
    CREATE TABLE IF NOT EXISTS students (
        student_id INT NOT NULL AUTO_INCREMENT,
        student_name VARCHAR(100) NOT NULL,
        student_addr VARCHAR(100) NOT NULL,
        student_age VARCHAR(3) NOT NULL,
        student_qual VARCHAR(20) NOT NULL,
        student_percent VARCHAR(10) NOT NULL,
        student_year_passed VARCHAR(10) NOT NULL,
        PRIMARY KEY (student_id)
    );
    exit;

    # Copy the built artifacts to Tomcat's webapps directory
    sudo cp /home/ubuntu/Studentapp/target/*.war /opt/tomcat/webapps/ 
    sudo cp /home/ubuntu/Studentapp/*.jar /opt/tomcat/lib/

    # Start Tomcat
    sudo bash /opt/tomcat/bin/catalina.sh start
  EOF

  tags = {
    Name = "StudentApp-EC2"
  }

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}
