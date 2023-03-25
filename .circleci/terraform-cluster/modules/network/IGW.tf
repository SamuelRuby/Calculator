# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "IGW" {
  vpc_id =  aws_vpc.Altschool_Net.id 
  tags = var.proj-tag
}

# Create an internet gateway
#  resource "aws_internet_gateway_attachment" "IGW_Attachment" {
#   internet_gateway_id = aws_internet_gateway.IGW.id
#   vpc_id              = aws_vpc.Altschool_Net.id
# }