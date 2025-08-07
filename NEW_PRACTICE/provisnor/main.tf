provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "count_ec2" {
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    key_name = "New_Virgi_key"
    tags = {
      Name = "provisnor"
    }

    provisioner "file" {
       source = "./script.sh"
       destination = "/opt/script.sh"

       connection {
           type = "ssh"
           user = "ec2-user"
           private_key = file("~/id_rsa")
           host = self.public_ip
         }

    }

    provisioner "remote-exec" {
        inline = [ 
            "sudo -i", 
            "bash /opt/script.sh"
         ]
         connection {
           type = "ssh"
           user = "ec2-user"
           private_key = file("~/id_rsa")
           host = self.public_ip
         }
      
    }

    provisioner "local-exec" {
        command = "echo hurry! Instance launched: ${self.public_ip} > new.txt"

      
    }
  
}