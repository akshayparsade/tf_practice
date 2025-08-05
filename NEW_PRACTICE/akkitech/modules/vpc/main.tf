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
   map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-public-subnet"
    env = var.env
  }
}

resource "aws_subnet" "akkitech_private_subnet" {
  vpc_id            = aws_vpc.akkitech_vpc.id
  cidr_block        = var.private_subnet_cidr
  #availability_zone = "us-east-1a"  # Change if needed
  #map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-private-subnet"
    env = var.env
  }
}

resource "aws_internet_gateway" "akkitech_igw" {
  vpc_id = aws_vpc.akkitech_vpc.id

  tags = {
    Name = "${var.project}-igw"
    env = var.env
  }
}

resource "aws_default_route_table" "defa_rt" {
  default_route_table_id = aws_vpc.akkitech_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}