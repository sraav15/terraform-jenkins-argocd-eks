module "sg" {
  source = "../modules/sg"
  vpc_id = module.vpc.vpc_id

  name_appsg      = var.name_appsg
  cidr_ipv4_appsg = var.cidr_ipv4_appsg
  
  
}