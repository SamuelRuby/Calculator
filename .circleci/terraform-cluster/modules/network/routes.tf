# Private Route Table
resource "aws_route_table" "PrivateRT" {
  vpc_id =  aws_vpc.Altschool_Net.id
  route {
    cidr_block = var.destination_cidr_block
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = var.proj-tag
}
# Route table for Public Subnets
resource "aws_route_table" "PublicRT" {
  vpc_id =  aws_vpc.Altschool_Net.id
  route {
    cidr_block = var.destination_cidr_block
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = var.proj-tag
}

# Route table Association with Private Subnets
resource "aws_route_table_association" "PrivateRTassociation_1" {
  subnet_id = aws_subnet.privatesubnet_1.id
  route_table_id = aws_route_table.PrivateRT.id
}

resource "aws_route_table_association" "PrivateRTassociation_2" {
  subnet_id = aws_subnet.privatesubnet_2.id
  route_table_id = aws_route_table.PrivateRT.id
}

# Route table Association with Public Subnets
resource "aws_route_table_association" "PublicRTassociation_1" {
  subnet_id = aws_subnet.publicsubnet_1.id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "PublicRTassociation_2" {
    subnet_id = aws_subnet.publicsubnet_2.id
    route_table_id = aws_route_table.PublicRT.id
}
