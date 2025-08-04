resource "aws_launch_configuration" "lc_home" {
    image_id = var.ami_id
    instance_type = var.inst
    key_name =
    security_groups =
    user_data = 
  
}