cluster_name           = "my-eks-cluster"
vpc_cidr               = "192.168.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b"]
private_subnet_cidrs = ["192.168.128.0/20", "192.168.144.0/20"]
public_subnet_cidrs  = ["192.168.0.0/20", "192.168.16.0/20"]
