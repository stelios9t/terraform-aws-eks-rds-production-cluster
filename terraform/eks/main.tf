module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.10.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  vpc_create = true
  vpc_cidr   = var.vpc_cidr
  
  #tags for K8S to assign load balancers, defines subnet usage
  #first is public ELB for public subnets
  #second is internal elb for private access
  subnet_type_tags = {
    "kubernetes.io/role/elb"  = 1
    "kubernetes.io/role/internal-elb" = 1
  }
  
  #Partition the subnets into /24 IPS so each subnet has its own IP address range to reserve
  #Routing tables are applied to subnets, not IPs, so without /24 allocation routing/NAT cannot be set
  #one public subnet for internet exposure
  public_subnets  = ["10.0.1.0/24"]
  #two private subnets to host worker nodes and RDS DB
  private_subnets = ["10.0.2.0/24", "10.0.3.0/24"]

  node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_type = "t2.micro" 
  }

  enable_irsa = true


}

}
