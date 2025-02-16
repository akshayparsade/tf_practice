provider "aws" {
    region = "ap-south-1"
  
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr =
    project = "cbz"
    env = "env"
    pri-sub-cidr = var
    pub-sub-cidr = var.pub_sub_cidr
}