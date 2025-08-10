module "eks" {
  # Use the official AWS EKS module from Terraform Registry
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"  # Specify the version of the EKS module to ensure consistency

  # Provide a name for your EKS cluster via variable
  cluster_name    = var.cluster_name

  # Specify the Kubernetes version for your EKS cluster
  cluster_version = "1.29"

  # Reference the existing VPC ID where the EKS cluster will be deployed
  # This VPC should be created or imported by another Terraform module named 'vpc'
  vpc_id          = module.vpc.vpc_id

  # Provide the subnet IDs where your worker nodes will be launched
  # Usually private subnets for better security
  subnet_ids      = module.vpc.private_subnets

  # Define your managed node groups for worker nodes in the EKS cluster
  eks_managed_node_groups = {
    default = {
      # Minimum number of EC2 instances in the node group (autoscaling minimum)
      min_size       = 1
      
      # Maximum number of EC2 instances in the node group (autoscaling maximum)
      max_size       = 3
      
      # Desired initial number of instances to launch
      desired_size   = 2

      # Specify the EC2 instance types for worker nodes
      # 't2.micro' is suitable for development/testing (not recommended for production)
      instance_types = ["t3.micro"]
    }
  }

  # Add tags to all AWS resources created by this module for identification
  tags = {
    Environment = "dev"      # Tag this environment as 'dev' for easy filtering
    Terraform   = "true"     # Indicate resources are managed by Terraform
  }
}