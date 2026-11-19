variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "state_bucket_prefix" {
  description = "Globally unique prefix for the Terraform state bucket"
  type        = string
  default     = "REPLACE-WITH-YOUR-NAME-terraform-state"
}

variable "lock_table_name" {
  description = "DynamoDB table retained for the legacy classroom example"
  type        = string
  default     = "terraform-state-lock"
}
