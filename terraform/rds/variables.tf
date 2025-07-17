variable "vpc_id" {
  description = "VPC for RDS"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets for RDS deployment"
  type        = list(string)
}

variable "db_username" {
  default     = "postgresadmin"
  description = "Master DB username"
}

variable "db_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  default     = "portfolio_db"
  description = "Initial database name"
}

variable "vpc_cidr" {}

variable "eks_node_sg_id" {
  type        = string
  description = "Security group ID of EKS worker nodes"
}
