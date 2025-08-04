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
    vpc_security_group_ids = [aws_security_group.lc_sg.id]
    user_data = filebase64("./home.sh")
}

resource "aws_launch_template" "lc_groccary" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name =var.key_name
    vpc_security_group_ids = [aws_security_group.lc_sg.id]
    user_data = filebase64("./groccary.sh")
}

resource "aws_launch_template" "lc_elctronix" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name =var.key_name
    vpc_security_group_ids =[aws_security_group.lc_sg.id]
    user_data = filebase64("./elctronix.sh")
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
  target_group_arns = [ aws_lb_target_group.tg_groccary.arn ]
}

resource "aws_autoscaling_policy" "asg_policy_grocery" {
  name                   = "asg_policy_home"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg_groccary.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
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
  target_group_arns = [ aws_lb_target_group.tg_home.arn ]

}

resource "aws_autoscaling_policy" "asg_policy_home" {
  name                   = "asg_policy_home"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg_home.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0  # Adjust this as needed
  }
}


resource "aws_autoscaling_group" "asg_lc_elctronix" {
  name                = "asg_lc_elctronix"  
  desired_capacity    = 2
  max_size            = 5
  min_size            = 2
  launch_template {
    id = aws_launch_template.lc_elctronix.id
    version = aws_launch_template.lc_elctronix.latest_version
  }
  vpc_zone_identifier = [var.subnet_id_1, var.subnet_id_2]
  target_group_arns = [ aws_lb_target_group.tg_elctronix.arn ]

}

resource "aws_autoscaling_policy" "asg_policy_lc_elctronix" {
  name                   = "asg_policy_lc_elctronix"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg_lc_elctronix.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0  # Set your desired target CPU percentage
  }
}

