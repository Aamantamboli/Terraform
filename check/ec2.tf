resource "aws_instance" "app_server" {
  ami           = "ami-0dee22c13ea7a9a67"  # Use the Ubuntu AMI ID for your region
  instance_type = var.instance_type
  key_name      = "mynewaaman"  # Replace with your key pair name

  # Reference the user_data.sh script
  user_data = file("user_data.sh")

  # Upload the SQL script to the EC2 instance using the file provisioner
  provisioner "file" {
    source      = "create_table.sql"
    destination = "/home/ubuntu/create_table.sql"

    # Connection configuration for SSH
    connection {
      type        = "ssh"
      user        = "ubuntu"                      # Default user for Ubuntu instances
      private_key = file("/path/to/your/private/key.pem")  # Path to your SSH private key
      host        = self.public_ip                # The public IP of the instance
    }
  }

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
