variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type = string
}

variable "availability_zones" {
  type = list(string)  # ✅ correct
}


variable "private_subnet_cidrs" {
    description = "CIDR blocks for private subnets"
    type = list(string)
}

variable "public_subnet_cidrs" {
    description = "CIDR blocks for public subnets"
    type = list(string)
}

variable "cluster_name" {
    description = "Name of the EKS cluster"
    type = string
}