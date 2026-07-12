module "vpc" {
  source = "../modules/vpc"

  cidr-block       = var.cidr_block
  instance-tenancy = var.instance_tenancy
  vpcname          = var.vpcname
}
