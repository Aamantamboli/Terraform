output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.studentvpc.id
}

output "subnet_id" {
  description = "The ID of the subnet."
  value       = aws_subnet.studentsubnet.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.studentinternetgateway.id
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = aws_security_group.studentsecuritygroup.id
}

output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.studentapp.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.studentapp.public_ip
}

output "instance_public_dns" {
  description = "The public DNS name of the EC2 instance."
  value       = aws_instance.studentapp.public_dns
}

output "db_instance_endpoint" {
  description = "The endpoint of the MariaDB RDS instance."
  value       = aws_db_instance.studentdb.endpoint
}

output "db_instance_id" {
  description = "The ID of the RDS database instance."
  value       = aws_db_instance.studentdb.id
}

output "db_subnet_group_name" {
  description = "The name of the RDS DB subnet group."
  value       = aws_db_subnet_group.studentdb_subnet_group.name
}
