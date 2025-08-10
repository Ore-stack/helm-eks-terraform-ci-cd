module "vpc" {
  # Use the official Terraform AWS VPC module (version 5.1.0)
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  # Name of the VPC to create
  name = "eks-vpc"

  # CIDR block for the VPC (private IP address range)
  cidr = "10.0.0.0/16"

  # Availability Zones (AZs) where subnets will be created
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

  # Public subnets for resources that need direct internet access (e.g., NAT gateways, Load Balancers)
  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]

  # Private subnets for resources that should NOT have direct internet access (e.g., EKS worker nodes)
  private_subnets = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]

  # Enable NAT Gateway(s) to allow outbound internet traffic from private subnets
  enable_nat_gateway = true

  # Use a single NAT Gateway shared across all private subnets (cost-effective)
  single_nat_gateway = true

  # Tags applied to all resources created by this module, useful for management and billing
  tags = {
    Name        = "eks-vpc"
    Environment = "dev"
  }
}