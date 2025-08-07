provider "aws" {
    region = "us-east-1"
  
}
#-LOOPS-#

# count - simple loop
# for - variable and output
# for each - for different configurations

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
    instance_type = each.value
    key_name = "New_Virgi_key"
    tags = {
        Name = "instance-${each.key}"
        Env = terraform.workspace
    }   
}

variable "instance_type" {
   default = {
       micro = "t2.micro"
       small = "t2.small"
       medium = "t2.medium"
  
   }
}

output "instance_type" {
    value = [for type in var.instance_type : "${type}"]
    
  
}