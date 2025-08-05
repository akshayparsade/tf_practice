provider "aws" {
    region = "us-east"
  
}

module "akkitech_vpc" {
 source = "./modules/vpc"
cidr = "10.0.0.0/16"
project = 
env =
private_subnet_cidr = 
public_subnet_cidr = 
}