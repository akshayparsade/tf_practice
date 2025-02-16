provider "aws" {
    region = "ap-south-1"
  
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr =
    project = "cbz"
    env = var.
    pri-sub-cidr = var.pri_sub_cidr
    pub-sub-cidr = var.pub_sub_cidr
}