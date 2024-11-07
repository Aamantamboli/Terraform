provider "aws" {
  region = var.this_aws_region
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.this_vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.this_igw_name
  }
}

# Create Public Subnet 1
resource "aws_subnet" "my_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.this_subnet_1_cidr_block
  availability_zone       = var.this_subnet_1_az
  map_public_ip_on_launch = true
  tags = {
    Name = var.this_subnet_1_name
  }
}

# Create Public Subnet 2
resource "aws_subnet" "my_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.this_subnet_2_cidr_block
  availability_zone       = var.this_subnet_2_az
  map_public_ip_on_launch = true
  tags = {
    Name = var.this_subnet_2_name
  }
}

# Create Route Table for Public Subnets
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.this_route_table_name
  }
}

# Create Route to Internet Gateway in the Route Table
resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Associate Route Table with Public Subnet 1
resource "aws_route_table_association" "my_route_table_assoc_1" {
  subnet_id      = aws_subnet.my_subnet_1.id
  route_table_id = aws_route_table.my_route_table.id
}

# Associate Route Table with Public Subnet 2
resource "aws_route_table_association" "my_route_table_assoc_2" {
  subnet_id      = aws_subnet.my_subnet_2.id
  route_table_id = aws_route_table.my_route_table.id
}
