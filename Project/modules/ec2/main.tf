resource "aws_instance" "private_instance" {
    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_id
    key_name = var.key_pair
    subnet_id = var.private_subnet_id
}

