resource "aws_vpc" "akkitech_vpc" {
  cidr_block           = var.cidr
  tags = {
    Name = "${var.project}-
  }
}