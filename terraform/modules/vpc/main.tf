resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = var.az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.az
  map_public_ip_on_launch = false 
  tags = {
    Name = "${var.project_name}-private"
  }
}

resource "aws_default_security_group" "aws_default_security_group" {
  vpc_id = aws_vpc.main.id
}