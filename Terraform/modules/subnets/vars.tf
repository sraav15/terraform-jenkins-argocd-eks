variable "vpc_id" {
  description = "vpc id"
  type = string
  
}

variable "azs" {
  description = "Mentioning availablity zones"
  type = list(string)
}

variable "public_subnets" {
  description = "Mentioning the pubilc subnets"
  type = list(string)
}

# variable "private_subnets_cidr" {
#   description = "Mentioning the private subnets"
#   type = list(string)
# }