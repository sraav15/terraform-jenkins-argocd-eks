
module "routetables" {
  source = "../modules/routetables"

  vpc_id                   = module.vpc.vpc_id
  igw_id                   = module.igw.igw
  route_cidr_block_pub     = var.route_cidr_block_pub
  # route_cidr_block_pvt = var.route_cidr_block_pvt
  public_subnets      =  module.subnets.public_subnets
}








