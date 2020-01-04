provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = var.aws_provider_role_arn
  }
}

#terraform {
#  # The configuration for this backend will be filled in by Terragrunt
#  backend "s3" {
#  }
#}

terraform {
  required_version = ">= 0.12"
}
