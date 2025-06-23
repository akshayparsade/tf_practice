output "cluster_endpoint" {
    description = "EKS clsuter endpoint"
    value = aws_eks_cluster.main.endpoint
}

output "cluster_name" {
    description = "EKS clsuter name"
    value = aws_eks_cluster.main.name
  
}