# Specify the provider (AWS)
provider "aws" {
  region = var.this_aws_region
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = data.aws_ami.example.id 
  instance_type = var.this_instance_type[0]              
  key_name      = var.this_key_pair          
  vpc_security_group_ids = [var.this_security_group]

  # Optional: Tagging the instance
  tags = var.this_tag
  
  # Optional: Associate a public IP with the instance (for public access)
  associate_public_ip_address = var.this_associate_public_ip

}  

