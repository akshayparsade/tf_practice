resource "aws_instance" "akkitech_instance" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.security_groups_id
  key_name = var.key_pair
  subnet_id = 
}