provider "aws" {
    region = "us-east"
  
}

module "akkitech_vpc" {
 source = "./modules/vpc"
cidr = var.vpc_cidr
project = "akkitrch.sol"
env = "dev"
private_subnet_cidr = "10.0.0.0/20"
public_subnet_cidr = "10.0.0.0/20"
}