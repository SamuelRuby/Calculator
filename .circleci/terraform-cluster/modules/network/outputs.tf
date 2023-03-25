output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.Altschool_Net.id
}

output "pub_subnet_1" {
  description = "ID of the public subnet"
  value       = aws_subnet.publicsubnet_1.id
}

output "pub_subnet_2" {
  description = "ID of the public subnet"
  value       = aws_subnet.publicsubnet_2.id
}

output "private_subnet_id_1" {
  description = "ID of the public subnet"
  value       = aws_subnet.privatesubnet_1.id
}

output "private_subnet_id_2" {
  description = "ID of the public subnet"
  value       = aws_subnet.privatesubnet_2.id
}

output "public_subnets" {
  description = "ID of the public subnet"
  value       = [aws_subnet.publicsubnet_1.id, aws_subnet.publicsubnet_2.id]
}

output "private_subnets" {
  description = "ID of the public subnet"
  value       = [aws_subnet.privatesubnet_1.id, aws_subnet.privatesubnet_2.id]
}
output "lb_sec_grps" {
  description = "ID of the public subnet"
  value       = [aws_security_group.load_balancer_SG.id]
}

output "web_server_SG" {
  description = "ID of the public subnet"
  value       = aws_security_group.web_server_SG.id
}