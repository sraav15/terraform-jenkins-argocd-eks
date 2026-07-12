variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "route_cidr_block_pub" {
  description = "cidr pub"
  type =  string
}
# variable "route_cidr_block_pvt" {
#   description = "cidr pub"
#   type =  string
# }

variable "public_subnets" {
  type = list(string)
}
