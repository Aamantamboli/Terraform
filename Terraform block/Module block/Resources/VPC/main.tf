# Create VPC
resource "aws_vpc" "studentvpc" {
  cidr_block = var.this_vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    Name = var.this_vpc_name
  }
}
