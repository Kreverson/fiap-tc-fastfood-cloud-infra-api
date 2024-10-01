output "vpc_id" {
  value    = aws_vpc.main_vpc.id
}

output "eks_private_subnet_ids" {
  value = aws_subnet.eks_private[*].id
}

output "eks_public_subnet_ids" {
  value = aws_subnet.eks_public[*].id
}

output "rds_private_subnet_ids" {
  value = aws_subnet.rds_private[*].id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "aws_private_route_table_id" {
  value = aws_route_table.private.id
}

output "aws_public_route_table_eks_id" {
  value = aws_route_table.public.id
}

output "aws_nat_gateway_eks_id" {
  value = aws_nat_gateway.nat.id
}

output "aws_private_route_table_eks_id" {
  value = aws_route_table.private.id
}

output "eks_cluster_endpoint" {
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_arn" {
  value       = aws_eks_cluster.eks_cluster.arn
}

output "eks_cluster_certificate" {
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "eks_cluster_name" {
  value       = aws_eks_cluster.eks_cluster.name
}

output "eks_node_group_name" {
  value       = aws_eks_node_group.eks_nodes.node_group_name
}

output "eks_node_group_role_arn" {
  value       = aws_iam_role.eks_node_role.arn
}

output "eks_node_group_scaling" {
  value = {
    desired_size = aws_eks_node_group.eks_nodes.scaling_config[0].desired_size
    min_size     = aws_eks_node_group.eks_nodes.scaling_config[0].min_size
    max_size     = aws_eks_node_group.eks_nodes.scaling_config[0].max_size
  }
}