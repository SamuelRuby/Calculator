module "network" {
  source = "./modules/network"
  namespace = var.namespace
  destination_cidr_block = var.destination_cidr_block
  main_vpc_cidr = var.main_vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones
}

module "ssh_key" {
  source = "./modules/ssh-key-pair"
  namespace = var.namespace
}

module "eks-cluster" {
  source = "./modules/eks-cluster"
  namespace = var.namespace
  pub_subnets = module.network.public_subnets
  priv_subnets = module.network.private_subnets
  availability_zones = var.availability_zones
  priv_subnet_id_1 = module.network.private_subnet_id_1
  priv_subnet_id_2 = module.network.private_subnet_id_2
  pub_subnet_id_1 = module.network.pub_subnet_1
  pub_subnet_id_2 = module.network.pub_subnet_2
  key_name = module.ssh_key.key_name
}