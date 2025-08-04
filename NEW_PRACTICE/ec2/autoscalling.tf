resource "aws_launch_configuration" "lc_home" {
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name =var.key
    security_groups =
    user_data = 
  
}