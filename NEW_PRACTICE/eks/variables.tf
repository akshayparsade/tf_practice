##########################
# Variables
##########################
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "demo-eks-cluster"
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t2.micro"]
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}