variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  default     = "eks-cluster-project"
  description = "Name of the EKS cluster"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}