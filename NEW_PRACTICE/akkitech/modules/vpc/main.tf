resource "aws_vpc" "akkitech_vpc" {
  cidr_block           = var.cidr
  tags = {
    Name = "${var.project}-vpc"
    env = var.env
  }
}

resource "aws_subnet" "akkitec_public_subnet" {
  vpc_id            = aws_vpc.akkitech_vpc.id
  cidr_block        = var.pub
  availability_zone = "us-east-1a"  # Change if needed
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}