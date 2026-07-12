module "ec2" {
  source = "../modules/compute"

  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  instance_name       = var.instance-name  
  public_subnets      = module.subnets.public_subnets
  vpc_sg_id           = [module.sg.appsg_id]


}

