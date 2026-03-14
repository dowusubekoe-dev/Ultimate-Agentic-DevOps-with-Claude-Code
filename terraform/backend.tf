# Remote State Backend (S3)
#
# HOW TO ENABLE:
# 1. Run `terraform init` and `terraform apply` WITHOUT this backend block first
#    so that all resources (including your state bucket) are created locally.
# 2. Create a dedicated S3 bucket for Terraform state (separate from the site bucket).
# 3. Uncomment the backend block below, fill in your state bucket name and
#    a DynamoDB table name for state locking (optional but recommended).
# 4. Run `terraform init -migrate-state` to move local state into S3.

# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-state-bucket"
#     key            = "agentic-ai-portfolio-site/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-state-lock"   # optional, for state locking
#   }
# }
