# AWS region where your resources will be deployed
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"  # Change this to your preferred AWS region if needed
}

# Name of the EKS cluster
variable "cluster_name" {
  description = "The name to assign to the EKS cluster"
  type        = string
  default     = "eks-microservices"  # Change this to a unique cluster name for your environment
}

# AWS Access Key ID for authentication
variable "aws_access_key" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true  # hides the value in logs/output
  default     = "<aws_access_key>"    # Set this via environment variables or terraform.tfvars for security
}

# AWS Secret Access Key for authentication
variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
  default     = "<aws_secret_key>"
}
