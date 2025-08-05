resource "aws_instance" "private_instance" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name = var.key_pair
  vpc_security_group_ids = var.security_groups_id
  subnet_id = var.private_subnet.id
}

resource "aws_instance" "public_instance" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name = var.key_pair
  vpc_security_group_ids = var.security_groups_id
  subnet_id = var.private_subnet.id
}