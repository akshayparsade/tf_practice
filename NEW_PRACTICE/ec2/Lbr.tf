resource "aws_lb_target_group" "tg_home" {
  name     = "tg-home"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/"
    port = 80
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "tg_groccary" {
  name     = "tg-groccary"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/groccary"
    port = 80
    protocol = "TCP"
  }
}

resource "aws_lb_target_group" "tg_elctronix" {
  name     = "tg-elctronix"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/elctronix"
    port = 80
    protocol = "TCP"
  }
}

resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lc_sg.id]
  subnets            = [var.subnet_id_1, var.subnet_id_2]

  tags = {
    app = "my-app"
    Environment = "production"
  }
}