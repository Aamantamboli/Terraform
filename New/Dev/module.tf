module "aws_web_server_vpc" {
  source = "./modules/aws-web-server-vpc"
}
 
module "aws_web_server_instance" {
  source            = "./modules/aws-web-server-instance"
  ec2_instance_type = var.ec2_instance_type
  vpc_id            = module.aws_web_server_vpc.vpc_id
  subnet_id         = module.aws_web_server_vpc.subnet_id
}
