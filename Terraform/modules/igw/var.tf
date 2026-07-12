variable "vpc_id" {
  description = "Mentioning the name of the vpc"
  type        = string
}

variable "igw" {
  description = "Mentioning the name of the internet gateway"
  type = map(string)
}
