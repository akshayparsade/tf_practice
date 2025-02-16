provider "aws" {
    region = "ap-south-1"
  
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr ="10.0.0.0/16"
    env = "cbz"
    pri-sub-cidr = "10.0.1"
    pub-sub-cidr =
}