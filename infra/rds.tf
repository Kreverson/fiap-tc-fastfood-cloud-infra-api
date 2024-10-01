resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_vpc.main_vpc]
}

resource "aws_subnet" "rds_private" {
  count             = length(var.rds_private_subnet_cidrs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.rds_private_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.environment}-rds-private-subnet-${count.index}"
    Environment = var.environment
  }

  depends_on = [aws_vpc.main_vpc]
}