resource "aws_launch_configuration" "lc-home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = aws_security_group.lc_home.id
    user_data = <<EOF
        #!/bin/bash
        apt install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo <h1> Welcome to Akkitech </h1> > /var/wwww/html/index.html
    EOF    
}

resource "aws_security_group" "lc_home" {
  name = "allow httpd "
    description = "HTTP port"
    ingress {                               
        from_port        = 80
        to_port          = 80
        protocol         = "-1"  
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress {                             
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }                                   
  
}