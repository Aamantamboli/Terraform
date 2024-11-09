# Create a security group for the EC2 instance
resource "aws_security_group" "example" {
  name        = var.this_aws_security_group[0]
  description = "Allow inbound HTTP and SSH traffic"

  ingress {
    from_port   = var.this_aws_security_group[1]
    to_port     = var.this_aws_security_group[1]
    protocol    = var.this_aws_security_group[3]
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (be cautious with this)
  }

  ingress {
    from_port   = var.this_aws_security_group[2]
    to_port     = var.this_aws_security_group[2]
    protocol    = var.this_aws_security_group[3]
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }
}