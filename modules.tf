module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = var.tags
  vpc_id       = var.vpc_id

}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = var.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
  public_subnet_1c = module.eks_network.subnet_pub_1c
}

module "node-groups" {
  source            = "./modules/node-groups"
  project_name      = var.project_name
  tags              = var.tags
  private_subnet_1a = module.eks_network.subnet_priv_1a
  private_subnet_1b = module.eks_network.subnet_priv_1b
  private_subnet_1c = module.eks_network.subnet_priv_1c
  cluster_name      = module.eks_cluster.cluster_name
}

module "eks_aws_load_balancer_controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = var.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
  region       = var.region
  vpc_id       = module.eks_network.vpc_id
}