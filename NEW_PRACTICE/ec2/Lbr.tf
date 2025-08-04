resource "aws_lb_target_group" "tg_home" {
  name     = "lb-tg"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/"
    port = 80
    protocol = "TCP"
  }
}