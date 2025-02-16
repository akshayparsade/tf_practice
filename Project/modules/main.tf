provider "aws" {
    region = "ap-south-1"
  
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr = var.vpc_cidr
    project = var.project
    env = var.env
    pri-sub-cidr = var.pri_sub_cidr
    pub-sub-cidr = var.pub_sub_cidr
}