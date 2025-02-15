resource "aws_lb_target_group" "tg_home" {
  name     = "tg_home"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}