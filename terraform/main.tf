data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "rds-db-password"
}
#Fetches data from secrets manager

module "eks" {
  source = "./eks"
  cluster_name = var.cluster_name
  vpc_cidr     = var.vpc_cidr
}

module "rds" {
  source           = "./rds"
  vpc_id           = module.eks.vpc_id
  vpc_cidr         = var.vpc_cidr
  private_subnets  = module.eks.private_subnets
  db_password      = data.aws_secretsmanager_secret_version.db_password.secret_string
  eks_node_sg_id = module.eks.worker_node_sg
}
