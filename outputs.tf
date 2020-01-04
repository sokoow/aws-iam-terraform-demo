output "iam_access_key_aidan" {
  value       = module.iam_user_aidan.this_iam_access_key_id
  description = "IAM Access Key"
}

output "iam_encrypted_secret_key_aidan" {
  value       = module.iam_user_aidan.this_iam_access_key_encrypted_secret
  description = "PGP encrypted, base 64 encoded IAM secret key."
}

output "iam_secret_key_aidan" {
  value       = module.iam_user_aidan.this_iam_access_key_secret
  description = "PGP encrypted, base 64 encoded IAM secret key."
}

output "iam_encrypted_password_aidan" {
  value       = module.iam_user_aidan.this_iam_user_login_profile_encrypted_password
  description = "PGP encrypted, base 64 encoded password"
}

output "iam_access_key_santiago" {
  value       = module.iam_user_santiago.this_iam_access_key_id
  description = "IAM Access Key"
}

output "iam_secret_key_santiago" {
  value       = module.iam_user_santiago.this_iam_access_key_secret
  description = "PGP encrypted, base 64 encoded IAM secret key."
}

output "iam_encrypted_secret_key_santiago" {
  value       = module.iam_user_santiago.this_iam_access_key_encrypted_secret
  description = "PGP encrypted, base 64 encoded IAM secret key."
}

output "iam_encrypted_password_santiago" {
  value       = module.iam_user_santiago.this_iam_user_login_profile_encrypted_password
  description = "PGP encrypted, base 64 encoded password"
}


output "aws_account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "PGP encrypted, base 64 encoded password"
}
