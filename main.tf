# --------------------------------------
# Configure the AWS provider
# --------------------------------------
provider "aws" {
  # Specify the AWS region where resources will be deployed.
  # This value is passed in as a variable called "aws_region".
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# --------------------------------------
# Configure Terraform Cloud backend
# --------------------------------------
terraform {
  cloud {
    # Replace this with your Terraform Cloud organization name.
    organization = "lancheholdings"

    workspaces {
      # Replace this with the name of your Terraform Cloud workspace for this project.
      name = "Eks-terraform"
    }
  }

  # --------------------------------------
  # Specify required providers and versions
  # --------------------------------------
  required_providers {
    aws = {
      # Specify the AWS provider source and version constraints.
      # "~> 5.0" means any 5.x version is acceptable.
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}