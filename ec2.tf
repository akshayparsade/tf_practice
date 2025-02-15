provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "my_ec2" {
    ami = "ami-00bb6a80f01f03502"
    instance_type = "t2.micro"
    key_name = "Ubuntu"
    security_groups = ["default"]
    tags = {
      "name" = "tf_instance"
    }
  
}