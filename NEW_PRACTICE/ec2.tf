provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "instance_1" {  # name must start with a letter or underscore
    tags = {
      "key" = "tf_ec2"
       "env" = "test"
    }
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    key_name = "New_Virgi_key"
    security_groups = ["default"]
}  

variable "ami_id" {
    type = string
    default = "value"
  
}