data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "rds-db-password"
}
#Fetches data from secrets manager

module "eks" {
  source = "./eks"
  cluster_name = var.cluster_name
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}

module "rds" {
  source           = "./rds"
  vpc_id     =      module.vpc.vpc_id
  vpc_cidr         = var.vpc_cidr
  private_subnets  = module.vpc.private_subnets
  db_password      = data.aws_secretsmanager_secret_version.db_password.secret_string
  eks_node_sg_id = module.eks.eks_node_security_group_id
}

module "vpc" {
  source = "./vpc"
}