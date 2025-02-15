resource "aws_lb_target_group" "tg_home" {
  name     = "tg_home"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/"
    port = 80
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "tg_laptop" {
  name     = "tg_laptop"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/laptop/"
    port = 80
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "tg_cloth" {
  name     = "tg_cloth"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/cloth/"
    port = 80
    protocol = "TCP"
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

resource "aws_lb_listener_rule" "my_lb_lisener_rule_laptop" {
  listener_arn = aws_lb_listener.my_lb_lisener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.static.arn
  }

  condition {
    path_pattern {
      values = ["/static/*"]
    }
  }
}