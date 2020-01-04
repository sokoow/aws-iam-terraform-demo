module "iam_group_developers" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version = "~> 2.0"

  name = "developers"

  assumable_roles = [
    module.iam_assumable_role_developers.this_iam_role_arn
  ]

  group_users = [
    "Eugene",
    "Milo",
    "Abigail",
    "Aidan"
  ]
}


module "iam_group_ops" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"
  version = "~> 2.0"

  name = "ops"

  assumable_roles = [
    module.iam_assumable_role_ops.this_iam_role_arn
  ]

  group_users = [
    "Santiago",
    "Felix",
    "Morgan"
  ]
}
