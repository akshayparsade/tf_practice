provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_vpc" "my-vpc" {
  cidr_block = var.cidr-ip
  tags = {
    Name = "${var.project}-vpc"
    env = var.env
  }
}

resource "aws_internet_gateway" "my-vpc-gw" {
  vpc_id = var.aws_vpc.my-vpc.id

  tags = {
    Name = "${var.}"
  }
}

resource "aws_subnet" "sub-1a" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "sub-1b" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Main"
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