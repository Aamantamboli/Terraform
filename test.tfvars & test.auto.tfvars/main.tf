# Specify the provider (AWS)
provider "aws" {
  region = var.this_aws_region # Choose your desired region
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.this_aws_ami 
  instance_type = var.this_aws_instance[0]              
  key_name      = var.this_aws_key_pair          
  vpc_security_group_ids = [var.this_aws_security_group]

  # Optional: Tagging the instance
  tags = var.this_aws_tag
  
  # Optional: Associate a public IP with the instance (for public access)
  associate_public_ip_address = var.this_aws_associate_public_ip
}  

