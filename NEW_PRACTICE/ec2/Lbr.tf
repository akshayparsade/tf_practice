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
    path = "/electro"
    port = 80
    protocol = "TCP"
  }
}