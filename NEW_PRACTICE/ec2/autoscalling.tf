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

resource "aws_launch_configuration" "lc_home" {
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name =var.key_name
    security_groups = aws_security_group.lc_sg.id
    user_data = <<EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    echo "<h1> Hello World </h1> <br> <h2>Welcome to akkitech </h2>" > /var/www/html/index.html
    EOF 
}

resource "aws_launch_configuration" "lc_groccary" {
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name =var.key_name
    security_groups = aws_security_group.lc_sg.id
    user_data = <<EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/groccary
    echo "<h1> This is groccary Page  </h1>" > /var/www/html/index.html
    EOF 
}

resource "aws_launch_configuration" "lc_elctronix" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name =var.key_name
    security_groups = aws_security_group.lc_sg.id
    user_data = <<EOF
    #!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/elctronix
    echo "<h1> SALE SALE SALE ON  elctronix items  </h1>" > /var/www/html/index.html
    EOF 
}

resource "aws_autoscaling_group" "asg_home" {
  name                = "asg_home"  
  desired_capacity    = 2
  max_size            = 5
  min_size            = 2
  vpc_zone_identifier = [var.subnet_id_1, var.subnet_id_2]
  launch_configuration = aws_launch_configuration.lc_home
}

resource "aws_autoscaling_policy" "asg_policy" {
  autoscaling_group_name = aws_autoscaling_group.asg_home
  name                   = "asg_policy_home"
  policy_type            = "PredictiveScaling"
  predictive_scaling_configuration {
    metric_specification {
      target_value = 10
      predefined_load_metric_specification {
        predefined_metric_type = "ASGTotalCPUUtilization"
        resource_label         = "app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff"
      }
      customized_scaling_metric_specification {
        metric_data_queries {
          id = "scaling"
          metric_stat {
            metric {
              metric_name = "CPUUtilization"
              namespace   = "AWS/EC2"
              dimensions {
                name  = "AutoScalingGroupName"
                value = "my-test-asg"
              }
            }
            stat = "Average"
          }
        }
      }
    }
  }
}