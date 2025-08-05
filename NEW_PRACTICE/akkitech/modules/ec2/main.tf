resource "aws_instance" "akkitech_instance" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [  ]
}