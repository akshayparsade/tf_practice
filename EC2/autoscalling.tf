resource "aws_security_group" "my_sg" {
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
    security_groups = [aws_security_group.my_sg.id]
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
    security_groups = [aws_security_group.my_sg.id]
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
    security_groups = [aws_security_group.my_sg.id]
    user_data = <<EOF
        #!/bin/bash
        apt install httpd -y
        systemctl start httpd
        systemctl enable httpd
        mkdir /var/www/html/cloth
        echo <h1> SALE SALE SALE ON Cloths </h1> > /var/wwww/html/cloth/index.html
    EOF    
}

resource "aws_autoscaling_group" "asg_home" {
  name =              "asg-name"  
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  launch_configuration = aws_launch_configuration.lc-home.name
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [ aws_lb_target_group.tg_home.arn ]

  }
  resource "aws_autoscaling_policy" "asg_policy" {
  autoscaling_group_name = aws_autoscaling_group.asg_home.name
  name                   = "asg_policy_home"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 10
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}

resource "aws_autoscaling_group" "asg_laptop" {
   name =              "asg-name"  
   
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  launch_configuration = aws_launch_configuration.lc-laptop.name
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [ aws_lb_target_group.tg_laptop.arn ]


  }

  resource "aws_autoscaling_policy" "asg_policy" {
  autoscaling_group_name = aws_autoscaling_group.asg_laptop.name
  name                   = "asg_policy_home"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 50
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}

resource "aws_autoscaling_group" "asg_cloth" {
      name =              "asg-name"  

  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  launch_configuration = aws_launch_configuration.lc-cloth.name
  vpc_zone_identifier  = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [ aws_lb_target_group.tg_cloth.arn ]

  }
  resource "aws_autoscaling_policy" "asg_policy" {
  autoscaling_group_name = aws_autoscaling_group.asg_cloth.name
  name                   = "asg_policy_home"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 10
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
      }
    }
  }
}