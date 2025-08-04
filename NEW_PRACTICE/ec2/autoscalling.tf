resource "aws_security_group" "lc_sg" {
    name        = "allow_tls"
   description = "Allow HTTP Port public"
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "lc_home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name =var.key_name
    vpc_security_groups_ids = [ aws_security_group.lc_sg.id ]
    user_data = <<EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "<h1> Hello World </h1> <br> <h2>Welcome to akkitech </h2>" > /var/www/html/index.html
    EOF 
}

resource "aws_launch_template" "lc_groccary" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name =var.key_name
    vpc_security_groups_ids = [ aws_security_group.lc_sg.id ]
    user_data = <<EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/groccary
    echo "<h1> This is groccary Page  </h1>" > /var/www/html/index.html
    EOF 
}

resource "aws_launch_template" "lc_elctronix" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name =var.key_name
    vpc_security_groups_ids =[ aws_security_group.lc_sg.id ]
    user_data = <<EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/elctronix
    echo "<h1> SALE SALE SALE ON  elctronix items  </h1>" > /var/www/html/index.html
    EOF 
}

resource "aws_autoscaling_group" "asg_groccary" {
  name                = "asg_groccary"  
  desired_capacity    = 2
  max_size            = 5
  min_size            = 2
  launch_template {
    id = aws_launch_template.lc_groccary.id
    version = aws_launch_template.lc_groccary.latest_version
  }
  vpc_zone_identifier = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [ aws_lb_target_group.tg_groccary ]
}

resource "aws_autoscaling_policy" "asg_policy_groccary" {
  autoscaling_group_name = aws_autoscaling_group.asg_groccary
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

resource "aws_autoscaling_group" "asg_home" {
  name                = "asg_home"  
  desired_capacity    = 2
  max_size            = 5
  min_size            = 2
  launch_template {
    id = aws_launch_template.lc_home.id
    version = aws_launch_template.lc_home.latest_version
  }
  vpc_zone_identifier = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [ aws_lb_target_group.tg_home ]

}

resource "aws_autoscaling_policy" "asg_policy_home" {
  autoscaling_group_name = aws_autoscaling_group.asg_home
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

resource "aws_autoscaling_group" "asg_lc_elctronix" {
  name                = "asg_lc_elctronix"  
  desired_capacity    = 2
  max_size            = 5
  min_size            = 2
  vpc_zone_identifier = [var.subnet_id_1, var.subnet_id_2]
  launch_configuration = aws_launch_configuration.lc_home
  target_group_arns = [ aws_lb_target_group.tg_elctronix ]

}

resource "aws_autoscaling_policy" "asg_policy_lc_elctronix" {
  autoscaling_group_name = aws_autoscaling_group.asg_lc_elctronix
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
