provider "aws" {
  region = var.region
}

terraform {
  backend s3 {
    bucket         = var.tf_state_bucket
    dynamodb_table = var.tf_state_table
    region         = var.region
    key            = "vpc/terraform.tfstate"
  }
}