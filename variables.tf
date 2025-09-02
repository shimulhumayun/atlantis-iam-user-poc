variable "users" {
  description = <<EOT
Map of IAM users to create.

Example:
users = {
  "alice" = {
    policies          = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    tags              = { team = "platform" }
    create_access_key = false
  }
  "bob" = {
    policies          = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
    ]
    tags              = { team = "data" }
    create_access_key = true
  }
}
EOT

  type = map(object({
    policies          = optional(list(string), [])
    tags              = optional(map(string), {})
    create_access_key = optional(bool, false)
  }))
  default = {}
}

# Optional: if you want to store generated access keys in SSM Parameter Store
variable "store_access_keys_in_ssm" {
  type        = bool
  default     = false
  description = "If true, store each created user's access key in SSM as SecureString JSON."
}

variable "ssm_path_prefix" {
  type        = string
  default     = "/iam/user-keys"
  description = "SSM path prefix where access keys are stored when enabled."
}
