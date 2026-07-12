module "igw" {
  source = "../modules/igw"

  vpc_id = module.vpc.vpc_id
  igw = {
    Name = "Infra-igw"
  }
}