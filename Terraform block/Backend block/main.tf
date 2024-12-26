provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami = "ami-053b12d3152c0cc71" 
}
