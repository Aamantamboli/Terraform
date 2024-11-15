# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
