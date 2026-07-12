output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
  
}

# output "privateappsubnet" {
#   value = aws_subnet.private_subnets[*].id
  
# }
