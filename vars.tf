variable "aws_region" {
  description = "The AWS region to deploy to (e.g. us-east-1)"
  type        = string
  default     = "eu-west-1"
}

variable "aws_provider_role_arn" {
  description = ""
  type        = string
  default     = ""
}
