resource "aws_subnet" "eks_private" {
  count             = length(var.eks_private_subnet_cidrs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.eks_private_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.environment}-eks-private-subnet-${count.index}"
    Environment = var.environment
  }

  depends_on = [aws_vpc.main_vpc]
}

resource "aws_subnet" "eks_public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-eks-public-subnet-${count.index}"
    Environment = var.environment
  }

  depends_on = [aws_vpc.main_vpc]
}

module "eks" {
  version         = "17.24.0"
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.21"
  subnets         = concat(aws_subnet.eks_private[*].id, aws_subnet.eks_public[*].id)
  vpc_id          = aws_vpc.main_vpc.id

  node_groups = {
    workers = {
      desired_capacity = var.desired_size
      max_capacity     = var.max_size
      min_capacity     = var.min_size
      instance_type    = var.instance_type
    }
  }

  tags = {
    Environment = var.environment
    Project     = "${var.environment}-fastfood-api"
  }
}
