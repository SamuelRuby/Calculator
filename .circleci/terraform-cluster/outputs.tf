output "pub_subnet"{
  description = "ID of the public subnet"
  value       = module.network.public_subnets

}

output "priv_subnet"{
  description = "ID of the private subnet"
  value       = module.network.private_subnets

}

output "endpoint" {
  value = module.eks-cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = module.eks-cluster.kubeconfig-certificate-authority-data
}

output "id" {
  value = module.eks-cluster.id
}

output "name" {
  value = module.eks-cluster.name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "pub_subnet_1" {
  description = "ID of the public subnet"
  value       = module.network.pub_subnet_1
}

output "pub_subnet_2" {
  description = "ID of the public subnet"
  value       = module.network.pub_subnet_2
}
