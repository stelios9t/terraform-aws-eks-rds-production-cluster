module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  
  #tags for K8S to assign load balancers, defines subnet usage
  #first is public ELB for public subnets
  #second is internal elb for private access
  tags = {
    "kubernetes.io/cluster/${var.vpc_name}" = "shared"
    "kubernetes.io/role/elb"                = 1
    "kubernetes.io/role/internal-elb"       = 1
  }
}