resource "aws_lb_target_group" "tg_home" {
  name     = "tg-home"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    port = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "tg_laptop" {
  name     = "tg-laptop"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
    health_check {
    path = "/laptop/"
    port = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "tg_cloth" {
  name     = "tg-cloth"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/cloth/"
    port = 80
    protocol = "HTTP"
  }
}

resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_sg.id]
  subnets            = [var.subnet_id_1, var.subnet_id_2]
  tags = {
    app = "my-app"
    Environment = "production"
  }
}

resource "aws_lb_listener" "my_lb_lisener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = "80"
  protocol          = "HTTPS"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_home.arn
  }
}

resource "aws_lb_listener_rule" "my_lb_lisener_rule_home" {
  listener_arn = aws_lb_listener.my_lb_lisener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_home.arn
  }

  condition {
    path_pattern {
      values = ["/home/*"]
    }
  }
}

resource "aws_lb_listener_rule" "my_lb_lisener_rule_laptop" {
  listener_arn = aws_lb_listener.my_lb_lisener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_laptop.arn
  }

  condition {
    path_pattern {
      values = ["/laptop/*"]
    }
  }
}

resource "aws_lb_listener_rule" "my_lb_lisener_rule_cloth" {
  listener_arn = aws_lb_listener.my_lb_lisener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_cloth.arn
  }

  condition {
    path_pattern {
      values = ["/cloth/*"]
    }
  }
}
