resource "aws_route_table" "public-rt" {
  vpc_id = var.vpc_id

   route {
    cidr_block = var.route_cidr_block_pub
    gateway_id = var.igw_id
  }
  tags =  {
    Name= "pubilc-rt"
  }
}

# resource "aws_route_table" "private-rt" {
#     vpc_id = var.vpc_id
    
#    route {
#     cidr_block = var.route_cidr_block_pvt

    
#   }

#     tags = {
#       Name="private-rt"
#     }
# }

resource "aws_route_table_association" "public-rt-assc" {
  subnet_id      = var.public_subnets[0]
  route_table_id = aws_route_table.public-rt.id
  
}

