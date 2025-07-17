variable "vpc_name" {
  default     = "eks-vpc"
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}
  #Partition the subnets into /24 IPS so each subnet has its own IP address range to reserve
  #Routing tables are applied to subnets, not IPs, so without /24 allocation routing/NAT cannot be set
variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
  description = "Private subnet CIDRs"
}

variable "azs" {
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
  description = "Availability zones"
}