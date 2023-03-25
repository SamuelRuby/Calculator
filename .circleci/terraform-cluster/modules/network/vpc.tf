# Create the VPC
resource "aws_vpc" "Altschool_Net" {
  cidr_block       = var.main_vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = var.proj-tag
}