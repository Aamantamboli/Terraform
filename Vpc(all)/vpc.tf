resource "aws_vpc" "this_vpc" {
    cidr_block = var.this_vpc_cidr_block 
    tags =  {
        Name = var.this_vpc_tags 
    }
}

resource "aws_subnet" "this_subnet_pub" {
  vpc_id     = aws_vpc.this_vpc.id  
  availability_zone = "ap-south-1a"
  cidr_block = var.this_subnet_pub_cidr_block      
  map_public_ip_on_launch = var.this_subnet_pub_map_ip 
  tags = {
    Name = var.this_subnet_pub_tags 
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.this_ami 
  instance_type = var.this_instance_type[0]              
  key_name      = var.this_key_pair          
  vpc_security_group_ids = [var.this_security_group]
  subnet_id =  output.vpcsubnet_id.value

  # Optional: Tagging the instance
  tags = var.this_tag
  
  # Optional: Associate a public IP with the instance (for public access)
  associate_public_ip_address = var.this_associate_public_ip
}  