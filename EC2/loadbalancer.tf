resource "aws_lb_target_group" "tg_home" {
  name     = "tg_home"
  port     = 80
  protocol = "HTTP"
  health_check {
    path = "/"
    port = 
  }
}