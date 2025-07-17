terraform {
  backend "s3" {
    bucket         = "eks-rds-project-bucket"
    key            = "eks/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
