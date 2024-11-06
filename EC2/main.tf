# Specify the provider (AWS)
provider "aws" {
  region = var.this_aws_region # Choose your desired region
}

# Create a security group for the EC2 instance
resource "aws_security_group" "example" {
  name        = var.this_aws_security_group[0]
  description = "Allow inbound HTTP and SSH traffic"

  ingress {
    from_port   = var.this_aws_security_group[1]
    to_port     = var.this_aws_security_group[1]
    protocol    = var.this_aws_security_group[3]
    cidr_blocks = [var.this_aws_security_group[4]]  # Allow SSH from anywhere (be cautious with this)
  }

  ingress {
    from_port   = var.this_aws_security_group[2]
    to_port     = var.this_aws_security_group[2]
    protocol    = var.this_aws_security_group[3]
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.this_aws_instance[0] 
  instance_type = var.this_aws_instance[1]              
  #key_name      = "your-ssh-key"          
  security_groups = [aws_security_group.example.name]

  # Optional: Tagging the instance
  tags = {
    Name = "ExampleInstance"
  }
  
  # Optional: Associate a public IP with the instance (for public access)
  associate_public_ip_address = var.this_aws_instance[2]
}  

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}