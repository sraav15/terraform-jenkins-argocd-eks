resource "aws_subnet" "public_subnets" {
  vpc_id = var.vpc_id
  count  = length(var.public_subnets)
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${var.azs[count.index]}"
  }
}


# resource "aws_subnet" "private_subnets" {
#   vpc_id = var.vpc_id
#   count  = length(var.private_subnets_cidr)
#   cidr_block        = var.private_subnets_cidr[count.index]
#   availability_zone = var.azs[count.index]
#  map_public_ip_on_launch = false

#   tags = {
#     Name = "private-${var.azs[count.index]}"
#   }
# }