provider "aws" {
    region = "us-east-1"
  
}


resource "aws_security_group" "ec2_sg" {
    name = "my_ec2_sg"
    description = "allow HTTP rule"
    ingress {
        from_port = 80
        to_port = 0
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
}
resource "aws_instance" "instance_1" {  # name must start with a letter or underscore
    tags = {
      "key" = "tf_ec2"
       "env" = "test"
    }
    ami = var.ami_id
    instance_type = var.instance_type
    key_name =  var.key_name
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
  type = string
  default = "New_Virgi_key"
  description = "Enter Key pair"
}