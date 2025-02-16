
resource "aws_vpc" "my-vpc" {
  cidr_block = var.cidr-ip.id
  tags = {
    Name = "${var.project}-vpc"
    env = var.env
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.aws_vpc.my-vpc.id

  tags = {
    Name = "${var.project}-igw"
    env = var.env
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
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-public-subnet"
  }
}


resource "aws_default_route_table" "r" {
  default_route_table_id = aws_vpc.cbz_vpc.default_route_table_id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project}-default-rt"
    env = var.env
  }
}

