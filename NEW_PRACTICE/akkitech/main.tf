provider "aws" {
    region = "us-east-1"
  
}

module "akkitech_vpc" {
source = "./modules/vpc"
cidr = var.vpc_cidr
project = var.project
env = var.env
private_subnet_cidr = var.private_subnet_cidr
public_subnet_cidr = var.public_subnet_cidr
}

# module "akkitech_ec2" {
#   source = "./modules/ec2"
#   ami = var.image_id
#   instance_type = var.instance_type
#   key_pair = var.key_pair
#   security_groups_id = var.security_groups_id
#   private_subnet_id = var.pri_sub_id
#   public_subnet_id = var.pub_sub_id
# }

resource "aws_security_group" "lc_sg" {
    name        = "allow_tls"
   description = "Allow HTTP Port public"
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}