variable "aws_region" {
  description = "AWS região"
  type = string
}

variable "state_file" {
  description = "S3 Bucket state file"
  type = string
}

variable "environment" {
  description = "Ambiente (dev ou prod)"
  type        = string
}

variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block para a VPC"
  type        = string
}

variable "eks_private_subnet_cidrs" {
  description = "CIDRs para as subnets privadas usadas pelo EKS"
  type        = list(string)
}

variable "rds_private_subnet_cidrs" {
  description = "CIDRs para as subnets privadas usadas pelo RDS"
  type        = list(string)
}


variable "public_subnet_cidrs" {
  description = "CIDRs das subnets públicas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Zonas de disponibilidade para as subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "Tipo de instância EC2 para os nós do EKS"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de nós no cluster"
  type        = number
}

variable "max_size" {
  description = "Número máximo de nós no cluster"
  type        = number
}

variable "desired_size" {
  description = "Número desejado de nós no cluster"
  type        = number
}
