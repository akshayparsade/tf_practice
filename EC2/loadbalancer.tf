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

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}