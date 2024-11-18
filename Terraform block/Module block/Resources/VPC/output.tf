#Output of vpc id
output "vpc_id" {
   value = aws_vpc.example.id
}

#Output of subnet id
output "subnet_id" {
   value = aws_subnet.examplesubnet.id
}

#Output of security group
output "security_group_id" {
   value = aws_security_group.examplesecuritygroup.id
}