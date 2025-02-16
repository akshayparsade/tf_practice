provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_vpc" "my-vpc" {
  cidr_block = var.cidr-ip.id
  tags = {
    Name = "${var.project}-vpc"
    env = var.env
  }
}

resource "aws_internet_gateway" "my-vpc-gw" {
  vpc_id = var.aws_vpc.my-vpc.id

  tags = {
    Name = ""
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.pri-sub-cidr

  tags = {
    Name = "${var.project}-private-subnet"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.pub-sub-cidr
  map_public_ip_on_launch = 

  tags = {
    Name = "${var.project}-public-subnet"
  }
}

resource "aws_route_table" "sub-1a-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route = []

  tags = {
    Name = "example"
  }
}

resource "aws_route_table" "sub-1b-rt" {
  vpc_id = aws_vpc.my-vpc.id
  route = []

  tags = {
    Name = "example"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}