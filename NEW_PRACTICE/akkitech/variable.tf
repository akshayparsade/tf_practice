variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "project" {
  default = "akkitrch.sol"
}
variable "env" {
  default = "dev"
}
variable "private_subnet_cidr" {
  default = "10.0.0.0/20"
}
variable "public_subnet_cidr" {
  default = "10.0.0.16/20"
}

### EC2 #####

variable "image_id" {
  default = 
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_pair" {
  default = "New_Virgi_key"
}
variable "security_groups_id" {
  default = 
}