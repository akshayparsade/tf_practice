provider "aws" {
    region = "us-east"
  
}

module "akkitech_vpc" {
 source = "./modules/vpc"
cidr = "10.0.0.0/16"
project = "akkitrch.sol"
env = "dev"
private_subnet_cidr = "10.0.0.0."
public_subnet_cidr = 
}