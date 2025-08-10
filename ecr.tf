# Create an AWS Elastic Container Registry (ECR) repository for the frontend application
resource "aws_ecr_repository" "frontend" {
  # The name of the ECR repository (must be unique within your AWS account and region)
  name = "frontend"
}

# Create an AWS Elastic Container Registry (ECR) repository for the backend application
resource "aws_ecr_repository" "backend" {
  # The name of the ECR repository
  name = "backend"
}