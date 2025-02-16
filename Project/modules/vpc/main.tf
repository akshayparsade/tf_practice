
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

resource "aws_route_table" "sub-1a-rt" {
  vpc_id = aws_vpc.my-vpc.id
  gatway_id = aws_internet_gateway.igw.id

  tags = {
    Name = "${var.project}-rt"
  }
}

