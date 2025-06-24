variable "cluster_name" {
description = "cluster-name"
type = string
}

variable "vpc_id" {
    description = "vpc id"
   type = string
}

variable "subnet_ids" {
    description = "subnet IDs"
    type = list(string)
  
}
variable "cluster_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string
}

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
}