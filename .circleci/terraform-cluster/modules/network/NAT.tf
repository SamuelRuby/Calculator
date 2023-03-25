# Create NAT Gateway
resource "aws_eip" "nat" {
  vpc = true
  tags = var.proj-tag
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.publicsubnet_1.id
  tags = var.proj-tag
  depends_on = [
    aws_internet_gateway.IGW
  ]
}
