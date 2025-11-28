# VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project}-vpc"
  }
}

# Subnet
resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.project}-subnet"
  }
}

# Internet Gateway (optional if public internet access required)
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project}-igw"
  }
}

# Route table to attach public route to IGW
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "${var.project}-rt"
  }
}

resource "aws_route_table_association" "subnet_assoc" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}

