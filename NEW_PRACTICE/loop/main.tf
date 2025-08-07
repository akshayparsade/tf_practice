provider "aws" {
    region = "us-east-1"
  
}
#-LOOPS-#

# count
# for
# for each

# resource "aws_instance" "count_ec2" {
#     count = 3
#     ami = "ami-08a6efd148b1f7504"
#     instance_type = "t2.micro"
#     key_name = "New-Virgi-key"
#     tags = {
#       Name = "instance-${value}"
#       Env = terraform.workspace
#     }
  
# }

resource "aws_instance" "for_each_ec2" {
    for_each = var.instance_type
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    key_name = "New_Virgi_key"
    tags = {
        Name = "instace-${value}"
        Env = terraform.workspace
    }   
}

variable "instance_type" {
   
}