# Create a security group for the EC2 instance
resource "aws_security_group" "example" {
  name        = var.this_aws_security_group_name
  description = "Allow inbound HTTP and SSH traffic"

  ingress {
    from_port   = var.this_aws_security_group_port[0]
    to_port     = var.this_aws_security_group_port[0]
    protocol    = var.this_aws_security_group_protocol
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (be cautious with this)
  }

  ingress {
    from_port   = var.this_aws_security_group_port[1]
    to_port     = var.this_aws_security_group_port[1]
    protocol    = var.this_aws_security_group_protocol
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }
}