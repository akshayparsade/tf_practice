output "cluster_endpoint" {
    description = "EKS clsuter endpoint"
    value = module.eks.cluster_endpoint
}

output "cluster_name" {
    description = "EKS clsuter name"
    value = module.eks.cluster_name
  
}

output "vpc_id" {
    description = "vpc id"
    value = module.vpc.vpc_id
  
}