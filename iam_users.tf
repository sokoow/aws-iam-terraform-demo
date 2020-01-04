# this is mostly for password complexity rules
module "iam_account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-account"
  version = "~> 2.0"

  account_alias = "example-company"

  minimum_password_length = 10
  require_numbers         = false
}

# module abstraction for an iam user
# check https://github.com/terraform-aws-modules/terraform-aws-iam/issues/21 for corner cases
module "iam_user_eugene" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 2.0"

  name          = "Eugene"
  force_destroy = true

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  pgp_key = "keybase:test"

  password_reset_required = false
}

module "iam_user_milo" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 2.0"

  name          = "Milo"
  force_destroy = true

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  pgp_key = "keybase:test"

  password_reset_required = false
}

module "iam_user_abigail" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 2.0"

  name          = "Abigail"
  force_destroy = true

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  pgp_key = "keybase:test"

  password_reset_required = false
}

module "iam_user_aidan" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 2.0"

  name          = "Aidan"
  force_destroy = true

  create_iam_user_login_profile = false
  create_iam_access_key         = true
  # pgp_key = "keybase:test"

  password_reset_required = false
}

module "iam_user_santiago" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 2.0"

  name          = "Santiago"
  force_destroy = true

  create_iam_user_login_profile = false
  create_iam_access_key         = true
  # pgp_key = "keybase:test"

  password_reset_required = false
}

module "iam_user_felix" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 2.0"

  name          = "Felix"
  force_destroy = true

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  pgp_key = "keybase:test"

  password_reset_required = false
}

module "iam_user_morgan" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 2.0"

  name          = "Morgan"
  force_destroy = true

  create_iam_user_login_profile = true
  create_iam_access_key         = true
  pgp_key = "keybase:test"

  password_reset_required = false
}
