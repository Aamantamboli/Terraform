variable "this_vpc_cidr_block" {
    type = string
    default = "12.11.0.0/16"
    description = "The variable is for vpc cidr block"
}

variable "this_vpc_tags" {
    type = string
    default = "examplevpc"
    description = "The variable is for tag of vpc"
}

variable "this_subnet_pub_cidr_block" {
    type = string
    default = "12.11.0.0/17"
    description = "The variable is for subnet cidr block"
} 

variable "this_subnet_pub_map_ip" {
    type = bool
    default = true
    description = "The variable is for subnet map ip"
}

variable "this_subnet_pub_tags" {
    type = string
    default = "pub_subnet"
    description = "The variable is for tag of subnet"
}

variable "this_ami" {
    type = string
    default = "ami-0dee22c13ea7a9a67"
    description = "This variable is for aws ami"
}

variable "this_instance_type" {
    type = list
    default = ["t2.micro" , "t3.small" , "t3.large"]
    description = "This variable is for aws instance type"
}

variable "this_key_pair " {
    type = string
    default = "mynewaaman"
    description = "This variable is for aws key pair"
}

variable "this_security_group" {
    type = string
    default = "sg-043784a83b52774ca"
    description = "This variable is for aws security group" 
}

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

# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "vpcsubnet_id" {
    value = aws_subnet.this_subnet_pub.id
}