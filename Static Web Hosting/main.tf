# Specify the provider (AWS)
provider "aws" {
  region = var.this_aws_region
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = var.this_ami 
  instance_type = var.this_instance_type[0]              
  key_name      = var.this_key_pair          
  vpc_security_group_ids = [var.this_security_group]

  # Optional: Tagging the instance
  tags = var.this_tag
  
  # Optional: Associate a public IP with the instance (for public access)
  associate_public_ip_address = var.this_associate_public_ip

   user_data = <<-EOF
    #!/bin/bash
    sudo apt install unzip -y curl
    sudo apt install nginx -y
    curl -O https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
    sudo unzip oxer.zip
    sudo rm -rf /usr/share/nginx/html/*
    sudo mv oxer-html /usr/share/nginx/html
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF
}  

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.devopsengineer.shop"
  type    = "A"
  ttl     = 300
  records = [aws_eip.example.public_ip]
}

