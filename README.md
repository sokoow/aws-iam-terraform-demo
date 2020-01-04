# This is a demo of a terraform 0.12.x code and what can be done with IAM modules from: https://github.com/terraform-aws-modules/terraform-aws-iam/

It makes use of following parts:

**terraform-aws-modules/iam/aws//modules/iam-user** - users are being created using this module, I'm using PGP
**terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy** - this is a group abstraction, that has assumable role pinned to it
**terraform-aws-modules/iam/aws//modules/iam-assumable-role** - and as assumable role in the end

Structure is as follows:

- Setup is creating a bunch of IAM users (7 to be precise)
- Then it's creating two IAM groups: **developers**, and **ops**
- It assigns users to these groups
- Group also has an assumable role pinned to it
- Assumable roles require MFA

Using these modules saves a LOT of time and work.

## How do I run it ?

You just need terraform 0.12, and do the typical sequence:

```
terraform init
terraform plan
terraform apply
```

Terraform outputs should give you keys for one member of each groups: Aidan and Santiago.

You can test the whole lot using AWS CLI, here's how your ~/.aws/config should look like:

```
[default]

[profile ops]
role_arn = arn:aws:iam::AWS_ACCOUNT_NO_FROM_TERRAFORM_OUTPUT:role/ops
source_profile = mfa

```
here's how your ~/.aws/credentials file should look like:

```
[default]
aws_access_key_id = ACCESS_KEY_FROM_TERRAFORM_OUTPUT
aws_secret_access_key = SECRET_KEY_FROM_TERRAFORM_OUTPUT

[mfa]
aws_access_key_id = OUTPUT_OF_COMMAND_BELOW
aws_secret_access_key = OUTPUT_OF_COMMAND_BELOW
aws_session_token = OUTPUT_OF_COMMAND_BELOW

```

To get a session token, you need to issue:

```
aws sts get-session-token --serial-number arn:aws:iam::AWS_ID:mfa/Santiago --token-code XXXXXX
```

and put results of that command into ~/.aws/credentials again (there's probably a way to automate that).

And finally, you can issue your test aws cli statement:

```
aws ec2 describe-instances --region eu-west-1 --profile ops{
   "Reservations": []
}
```

## Gotchas

1. If you want to store IAM secrets and keys in your terraform state file (not using PGP), then you need to remember to set **create_iam_user_login_profile = false** for your IAM users, otherwise these modules won't work, as per: https://github.com/terraform-aws-modules/terraform-aws-iam/issues/21
