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

resource "aws_security_group" "my_sg" {
    name = "my-sg"
    description = "HTTP port"
    ingress = {                               # for inbound trafffic
        from_port        = 80
        to_port          = 80
        protocol         = "-1"  # TCP / UPD / -1 for all 
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress =  {                                  # for outbound trafic
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }                                   
  
}

resource "aws_instance" "my_ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_pair
    #security_groups = ["default"]
    vpc_security_group_ids = [aws_security_group.my_sg.id]  # referr id id=attribute
    tags = {
      "name" = "tf_instance"
    }
  
}

variable "ami" {
    type = string
    default = "ami-00bb6a80f01f03502"
    description = "Enter ami id for ap-south-1" # show in terminal
}
variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "instance_type:t2.micro"

}
variable "key_pair" {
    default = "Ubuntu"
  
}
# variable "sg" {
#     type = list
#     default = ["default"]
# }
output "demo" {
    value = "hellloooooooooooo"
  
}

output "public_ip" {
   
}