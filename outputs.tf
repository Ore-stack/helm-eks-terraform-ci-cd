# Output the name of the EKS cluster
output "cluster_name" {
  value       = module.eks.cluster_name
  description = "The name of the EKS cluster created by the module."
}

# Output the endpoint URL for the EKS cluster's Kubernetes API server
output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "The API server endpoint URL for the EKS cluster."
}

# Output the Base64 encoded certificate authority data required to communicate securely with the cluster
output "cluster_certificate_authority_data" {
  value       = module.eks.cluster_certificate_authority_data
  description = "The Base64 encoded certificate authority data for secure cluster communication."
}