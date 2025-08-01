variable "cluster_name" {
  default = "eks-cluster-project"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
#defines network scale/ip address range
#/16 gives thousands of ips
#/16 = first 16 bits are fixed (10.0), rest are allocatable (0.0)

variable "vpc_id" {
  type        = string
  description = "VPC ID where EKS is deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for worker nodes"
}
