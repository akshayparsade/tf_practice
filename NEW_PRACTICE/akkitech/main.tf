provider "aws" {
    region = "us-east"
  
}

module "akkitech_vpc" {
 source = "./modules/vpc"
cidr = var.vpc_cidr
project = var.project
env = var.env
private_subnet_cidr = var.
public_subnet_cidr = "10.0.0.0/20"
}