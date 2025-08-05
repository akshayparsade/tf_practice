resource "aws_vpc" "akkitech_vpc" {
  cidr_block           = var.cidr
  tags = {
    Name = "${var.project}-vpc"
    env = var.env
  }
}

resource "aws_subnet" "akkitech_public_subnet" {
  vpc_id            = aws_vpc.akkitech_vpc.id
  cidr_block        = var.public_subnet_cidr
  #availability_zone = "us-east-1a"  # Change if needed
  #map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "akkitech_private_subnet" {
  vpc_id            = aws_vpc.akkitech_vpc.id
  cidr_block        = var.private_subnet_cidr
  #availability_zone = "us-east-1a"  # Change if needed
  #map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet"
  }
}