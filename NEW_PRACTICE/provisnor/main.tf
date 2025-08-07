provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "count_ec2" {
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    key_name = "New-Virgi-key"
    tags = {
      Name = "provisnor"
    }

    provisioner "file" {
      
    }
  
}