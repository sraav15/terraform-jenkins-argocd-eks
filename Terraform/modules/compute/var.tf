variable "ami_id" {
    description = "ami"
    type = string
  
}

variable "instance_type" {
    description = "instance type"
    type = string
  
}



variable "key_name" {
    description = "key name"       

  
}   

variable "instance_name" {
  description = "ec2 name"
}   


variable "public_subnets" {
  type = list(string)
}

variable "vpc_sg_id" {
  type = list(string)
}