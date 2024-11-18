module "vpc" {
    source = "/opt/Terraform/Terraform block/Module block/Resources/VPC"
    this_vpc_cidr_block = "10.0.0.0/16"
    this_vpc_name = "example"
}

module "ec2" {
    source = "/opt/Terraform/Terraform block/Module block/Resources/EC2"
    this_ami = "ami-0dee22c13ea7a9a67"
    this_instance_type = "t2.micro"
    this_associate_public_ip = true
    this_security_group = "sg-043784a83b52774ca"
    this_instance_name = "ExampleInstance"
    this_key_name ="mynewaaman"
}
