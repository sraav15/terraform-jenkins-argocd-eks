resource "aws_vpc" "infra-vpc" {
   cidr_block                       = var.cidr-block
  instance_tenancy                 = var.instance-tenancy
  enable_dns_support               = var.enable-dns-support
  enable_dns_hostnames             = var.enable-dns-hostnames
  
  tags =  var.vpcname 
  
}