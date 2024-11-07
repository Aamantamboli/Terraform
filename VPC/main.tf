provider "aws" {
  region = var.aws_region
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.this_vpc[0]
  enable_dns_support = var.this_vpc[1]
  enable_dns_hostnames = var.this_vpc[1]
  tags = {
    Name = var.this_vpc[2]
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.this_internet_gateway
  }
}

# Create Public Subnet 1
resource "aws_subnet" "my_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.this_subnet_1[0]
  availability_zone       = var.this_subnet_1[1]
  map_public_ip_on_launch = var.this_subnet_1[2]
  tags = {
    Name = var.this_subnet_1[3]
  }
}

# Create Public Subnet 2
resource "aws_subnet" "my_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.this_subnet_2[0]
  availability_zone       = var.this_subnet_2[1]
  map_public_ip_on_launch = var.this_subnet_2[2]
  tags = {
    Name = var.this_subnet_2[3]
  }
}

# Create Route Table for Public Subnets
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.this_route_table
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

