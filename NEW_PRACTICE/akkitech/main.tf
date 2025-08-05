provider "aws" {
    region = "us-east"
  
}

module "akkitech_vpc" {
 source = "./modules/vpc"
cidr = 
}