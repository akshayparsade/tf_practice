resource "aws_launch_configuration" "lc_home" {
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name =var.key_name
    security_groups = var.security_groups
    user_data = <<EOF
    #!/bin/bash
    apt install httpd -y
    
  
}