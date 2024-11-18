#Output of vpc id
output "vpc_id" {
   value = aws_vpc.example.id
}

#Output of subnet id
output "subnet_id" {
   value = aws_subnet.examplesubnet.id
}