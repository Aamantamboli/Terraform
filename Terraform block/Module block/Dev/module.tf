module "vpc" {
    source = "/opt/Terraform/Terraform block/Module block/Resources/VPC"
    this_vpc_cidr_block = "10.0.0.0/16"
    this_enable_dns_support = true
    this_enable_dns_hostnames = true
    this_vpc_name = "exmaplevpc"
    this_subnet_cidr_block = "10.0.1.0/24"
    this_availability_zone = "ap-south-1a"
    this_map_public_ip_on_launch = true
    this_subnet_name ="examplesubnet"
    this_internet_gateway_name = "exampleigw"
    this_route_table_name = "examplert"
    this_security_group_name = "examplesg"
}

module "ec2" {
    source = "/opt/Terraform/Terraform block/Module block/Resources/EC2"
    this_ami = "ami-0dee22c13ea7a9a67"
    this_instance_type = "t2.micro"
    this_associate_public_ip = true
    this_security_group = output.security_group_id
    this_instance_name = "ExampleInstance"
    this_key_name ="mynewaaman"
}
