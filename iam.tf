# Step 1: Create an IAM user named "github-actions"
resource "aws_iam_user" "github" {
  name = "github-actions"
}

# Step 2: Attach the managed policy "AmazonEC2ContainerRegistryPowerUser" to the "github-actions" user
resource "aws_iam_user_policy_attachment" "github_ecr_access" {
  user       = aws_iam_user.github.name             # Reference the IAM user created above
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"  # AWS managed policy for ECR power user access
}