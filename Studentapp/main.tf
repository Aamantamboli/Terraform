provider "aws" {
  region = var.aws_region  # Change this to your desired region
}

resource "aws_instance" "student" {
  ami           = var.this_aws_ubuntu_ami_id
  instance_type = var.this_aws_instance_instance_type
  key_name      = var.this_aws_key_name

  tags = {
    Name = "studentapp"
  }
}
