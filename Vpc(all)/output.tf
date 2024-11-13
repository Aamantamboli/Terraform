# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "vpcsubnet_id" {
    value = aws_subnet.this_subnet_pub.id
}