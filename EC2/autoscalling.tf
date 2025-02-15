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


resource "aws_launch_configuration" "lc-laptop" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = aws_security_group.lc_home.id
    user_data = <<EOF
        #!/bin/bash
        apt install httpd -y
        systemctl start httpd
        systemctl enable httpd
        mkdir /var/www/html/laptop
        echo <h1> This is LAPTOP page </h1> > /var/wwww/html/laptop/index.html
    EOF    
}

resource "aws_launch_configuration" "lc-cloth" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = aws_security_group.lc_home.id
    user_data = <<EOF
        #!/bin/bash
        apt install httpd -y
        systemctl start httpd
        systemctl enable httpd
        mkdir /var/www/html/cloth
        echo <h1> SALE SALE SALE ON Cloths </h1> > /var/wwww/html/cloth/index.html
    EOF    
}

resource "aws_autoscaling_group" "example" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  launch_configuration = aws_launch_configuration.foobar.name
  vpc_zone_identifier  = [aws_subnet.example1.id, aws_subnet.example2.id]

  }