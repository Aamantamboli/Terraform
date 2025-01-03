#Output of vpc id
output "this_vpc_id" {
   value = aws_vpc.examplevpc.id
}

#Output of subnet id
output "this_subnet_id" {
   value = aws_subnet.examplesubnet.id
}

#Output of security group
output "this_security_group_id" {
   value = aws_security_group.examplesecuritygroup.id
}