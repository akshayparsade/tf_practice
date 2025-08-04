resource "aws_launch_configuration" "lc_home" {
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name =var.key_name
    security_groups = var.
    user_data = 
  
}