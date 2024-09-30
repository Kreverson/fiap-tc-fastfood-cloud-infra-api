output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main_vpc.id
}

output "eks_cluster_id" {
  description = "ID do cluster EKS"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_ids" {
  description = "IDs dos node groups do EKS"
  value       = module.eks.node_groups["workers"].id
}
