provider "aws" {
  region = var.region
}

resource "aws_vpc" "studentvpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "studentsubnet" {
  vpc_id            = aws_vpc.studentvpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.studentvpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

resource "aws_security_group" "studentsecuritygroup" {
  vpc_id = aws_vpc.studentvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name = var.instance_name
  }
}
