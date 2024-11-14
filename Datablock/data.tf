data "aws_ami" "example" {
    name_regex       = "static-ami"
    filter {
    name   = "name"
    values = ["static-ami"]
  }  
}