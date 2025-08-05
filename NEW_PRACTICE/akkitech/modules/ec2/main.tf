resource "aws_instance" "akkitech_instance" {
  image_id = var.image_id
  instance_type = var.instance_type
  
}