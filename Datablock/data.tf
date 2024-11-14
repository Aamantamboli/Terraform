data "aws_ami" "example" {
    name_regex       = "static-ami"
    filter {
    name   = "name"
    values = ["static-ami"]
  }  
}

data "aws_security_group" "default"{
    name = "default"
}

/* data "aws_security_groups" "my_sg" {
   /*  filter {
    name   = "group-name"
    values = ["default"]
    } 
 
filter {
    name   = "name"
    values = ["default"]
    }
} */