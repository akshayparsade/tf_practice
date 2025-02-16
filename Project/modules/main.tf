provider "aws" {
    region = "ap-south-1"
  
}

module "vpc_module" {
    source = "./modules/vpc"
    cidr =
    project = "cbz"
    env = "env"
    pri-sub-cidr = "10.0.1.0/16"
    pub-sub-cidr = "10.0.2.0/16"
}