resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }

  depends_on = [aws_vpc.main_vpc]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-public-route-table"
  }

  depends_on = [aws_vpc.main_vpc]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.eks_public[0].id

  tags = {
    Name = "${var.environment}-nat-gateway"
  }
}

resource "aws_eip" "nat_eip" {
  tags = {
    Name = "${var.environment}-nat-eip"
  }

  depends_on = [aws_vpc.main_vpc]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.environment}-private-route-table"
  }

  depends_on = [aws_nat_gateway.nat]
}