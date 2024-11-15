# Output the public IP of the instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

# Output the id of the instance
output "instance_id" {
    value = aws_instance.example.id
}