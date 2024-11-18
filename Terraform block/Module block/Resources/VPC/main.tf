# Create VPC
resource "aws_vpc" "examplevpc" {
  cidr_block = var.this_vpc_cidr_block
  enable_dns_support = var.this_enable_dns_support
  enable_dns_hostnames = var.this_enable_dns_hostnames
  instance_tenancy = "default"
  tags = {
    Name = var.this_vpc_name
  }
}

# Create Public Subnet in the VPC
resource "aws_subnet" "examplesubnet" {
  vpc_id            = aws_vpc.examplevpc.id
  cidr_block        = var.this_subnet_cidr_block
  availability_zone = var.this_availability_zone
  map_public_ip_on_launch = var.this_map_public_ip_on_launch
  tags = {
    Name = var.this_subnet_name
  }
}

# Create Internet Gateway for internet access
resource "aws_internet_gateway" "exampleigw" {
  vpc_id = aws_vpc.examplevpc.id
  tags = {
    Name = var.this_internet_gateway_name
  }
}

# Create Route Table
resource "aws_route_table" "exampletrt" {
  vpc_id = aws_vpc.examplevpc.id
  tags = {
    Name = var.this_route_table_name
  }
}  

resource "aws_route" "publicroute" {
  route_table_id = aws_route_table.exampletrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.exampleigw.id
}
 
# Associate Route Table with Subnet
resource "aws_route_table_association" "examplesa" {
  subnet_id      = aws_subnet.examplesubnet.id
  route_table_id = aws_route_table.exampletrt.id
}

# Create Security Group within the VPC
resource "aws_security_group" "studentsecuritygroup" {
  vpc_id = aws_vpc.examplevpc.id  # Ensure it is in the correct VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.this_security_group_name
  }
}