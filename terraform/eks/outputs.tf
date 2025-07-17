output "cluster_name" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "vpc_id" {
  value = module.eks.vpc_id
}

output "private_subnets" {
  value = module.eks.private_subnets
}

output "worker_node_sg" {
  value = module.eks.node_groups["default"].security_group_id
}
