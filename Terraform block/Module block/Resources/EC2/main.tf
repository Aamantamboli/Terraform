# EC2 Instance Creation
resource "aws_instance" "studentapp" {
  ami                          = var.this_ami
  instance_type                = var.this_instance_type
  associate_public_ip_address  = var.this_associate_public_ip
  subnet_id                    = output.examplesubnet.id
  vpc_security_group_ids       = [output.security_group_id.id]  # Use vpc_security_group_ids
  key_name                     = var.this_key_name 
  tags = {
    Name = var.this_instance_name
  }
}  
