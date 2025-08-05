provider "aws" {
    region = "us-east"
  
}

module "akkitech_vpc" {
 source = "./modules/vpc"
cidr = 
project = 
env =
private_subnet_cidr = 
public_subnet_cidr = 
}