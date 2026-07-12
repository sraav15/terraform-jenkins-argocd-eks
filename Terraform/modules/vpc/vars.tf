variable "cidr-block" {
  description = "Mentioning the range of the cidr block"
}

variable "instance-tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type = string
  default     = "default"
}

variable "enable-dns-support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable-dns-hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "vpcname" {
  description = "Mentioning the name of the vpc"
  type = map(string)
  default = {}
   }
