module "ec2" {
  source = "../modules/compute"

  for_each = var.instances

  ami_id              = var.ami_id
  instance_type       = each.value.instance_type
  key_name            = var.key_name
  instance_name       = each.key  
  public_subnets      = module.subnets.public_subnets
  vpc_sg_id           = [module.sg.appsg_id]

  # user_data = file("${path.module}/scripts/${each.value.user_data}")

    user_data = each.value.user_data

}

