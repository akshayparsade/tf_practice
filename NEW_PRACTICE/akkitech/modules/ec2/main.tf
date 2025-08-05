resource "aws_instance" "akkitech_instance" {
  image_id = var.i
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [  ]
}