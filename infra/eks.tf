module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.21"
  subnets         = concat(aws_subnet.private_subnet[*].id, aws_subnet.public_subnet[*].id)
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
    Project     = "fastfood"
  }
}
