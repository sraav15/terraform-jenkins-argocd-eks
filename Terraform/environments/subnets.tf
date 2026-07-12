module "subnets" {
  source = "../modules/subnets"

  vpc_id              = module.vpc.vpc_id
  azs                 = var.azs
  public_subnets      = var.public_subnets
  # private_subnets_cidr    = var.private_subnets_cidr
 

}



