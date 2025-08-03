provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "instance_1" {  # name must start with a letter or underscore
    tags = {
      "key" = "tf_ec2"
       "env" = "test"
    }
    ami = var.ami_id
    instance_type = 
    key_name = "New_Virgi_key"
    security_groups = ["default"]
}  

variable "ami_id" {
    type = string
    default = "ami-08a6efd148b1f7504"
    description = "Enter AMI ID"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
  type = s
}