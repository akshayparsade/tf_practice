resource "aws_launch_configuration" "lc-home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = var.security_groups
    user_data = <<EOF
        #!/bin/bash
        apt install 
  
}