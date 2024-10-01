output "vpc_id" {
  value       = aws_vpc.main_vpc.id
}

output "eks_cluster_id" {
  value       = module.eks.cluster_id
}

output "eks_cluster_certificate_authority_data" {
  value       = module.eks.cluster_certificate_authority_data
}

output "eks_cluster_endpoint" {
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_ids" {
  value       = module.eks.node_groups["workers"].id
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