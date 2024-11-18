module "aws_web_server_vpc" {
  source = "/opt/Terraform/New/Resources/Vpc"
}
 
module "aws_web_server_instance" {
  source            = "/opt/Terraform/New/Resources/Ec2"
  ec2_instance_type = var.ec2_instance_type
  vpc_id            = module.aws_web_server_vpc.vpc_id
  subnet_id         = module.aws_web_server_vpc.subnet_id
}
