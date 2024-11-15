# Specify the provider (AWS)
provider "aws" {
  region = var.this_aws_region # Choose your desired region
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.this_ami 
  instance_type = var.this_instance_type[0] 
}  