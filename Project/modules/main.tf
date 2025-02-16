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

module "ec2_module" {
    source = "./modules/ec2"
    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_id
    key_name = var.key_pair
    subnet_id = var.private_subnet_id
  
}