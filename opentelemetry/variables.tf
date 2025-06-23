variable "node_groups" {
  description = "subnet IDs"
  type = map(object({
    instance_type = list(string)
    capacity_type = string
    scaling_config = object({
     desired_size = number
     max_size = number
     min_size = number
    })
  }))
  default = {
    general = {
        instance_type = ["t2.medium"]
        capacity_type = "ON_DEMAND"
        scaling_config = {
            desired_size = 2
            max_size = 4
            min_size = 1
        }
    }
  }
} 

variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type = string
}

variable "availability_zones" {
    description = "Availability zone"
    type = string  
}

variable "private_subnet_cidrs" {
    description = "CIDR blocks for private subnets"
    type = list(string)
}

variable "public_subnet_cidrs" {
    description = "CIDR blocks for private subnets"
    type = list(string)
}

variable "cluster_name" {
    description = "Name of the EKS cluster"
    type = string
}