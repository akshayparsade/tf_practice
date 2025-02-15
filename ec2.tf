provider "aws" {
    region = "ap-south-1"
  
}

# resource "aws_instance" "my_ec2" {
#     ami = "ami-00bb6a80f01f03502"
#     instance_type = "t2.micro"
#     key_name = "Ubuntu"
#     security_groups = ["default"]
#     tags = {
#       "name" = "tf_instance"
#     }
  
# }

resource "aws_instance" "my_ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = ["default"]
    tags = {
      "name" = "tf_instance"
    }
  
}

variable "ami" {
    type = string
    default = "ami-00bb6a80f01f03502"
    description = "Enter ami id for ap-south-1"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "instance_type:t2.micro"

}
variable "key_name" {
    default = "Ubuntu"
  
}