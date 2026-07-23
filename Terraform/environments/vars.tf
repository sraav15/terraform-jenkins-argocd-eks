variable "vpcname" {
  description = "vpcname"

}

variable "cidr_block" {
  description = "vpc cid range"
  type        = string

}

variable "instance_tenancy" {
  description = "instance tenancy"
  type        = string
  default     = "default"

}



variable "azs" {
  description = "azs"
  type        = list(string)

}

# variable "private_subnets_cidr" {
#   description = "private subnets"

# }


variable "public_subnets" {
  description = "pubilc subnets"
  type = list(string)

}


# variable "route_cidr_block_pvt" {
#   description = "cidr pvt"
#   type        = string

# }



variable "route_cidr_block_pub" {
  description = "cidr pub"
  type        = string

}

variable "name_appsg" {
  description = "sg appsg"
  type        = string

}

variable "cidr_ipv4_appsg" {
  description = "ipv4 appsg"
  type        = string

}

variable "ami_id" {
  description = "ami id"
  type        = string

}



variable "key_name" {
  description = "key name"
  type        = string
}



variable "instances" {
  type = map(object({
    instance_type = string
    user_data = string 
  }))
}

