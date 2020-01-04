data "aws_caller_identity" "current" {}

module "iam_assumable_role_developers" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 2.0"

  # who can assume this role?
  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
  ]

  create_role = true

  role_name         = "developers"
  role_requires_mfa = true

  custom_role_policy_arns = [
    # There needs to be anything here, to be customised
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
  ]
}

module "iam_assumable_role_ops" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 2.0"

  # who can assume this role?
  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
  ]

  create_role = true

  role_name         = "ops"
  role_requires_mfa = true

  custom_role_policy_arns = [
  # There needs to be anything here, to be customised further on
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"

  ]
}
