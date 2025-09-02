variable "users" {
  description = "IAM users to create. Keys are arbitrary IDs; `name` is the IAM username."
  type = map(object({
    name              = string
    policies          = optional(list(string), [])
    tags              = optional(map(string), {})
    create_access_key = optional(bool, false)
  }))

  # Validate username format & uniqueness across all entries
  validation {
    condition = alltrue([
      for v in values(var.users) :
      length(regexall("^[0-9A-Za-z+=,.@_-]{1,64}$", v.name)) > 0
    ])
    error_message = "Each users[*].name must match ^[0-9A-Za-z+=,.@_-]{1,64}$."
  }

  validation {
    condition     = length(distinct([for v in values(var.users) : v.name])) == length(values(var.users))
    error_message = "Duplicate IAM usernames detected in users[*].name; each must be unique."
  }
}

# (keep these if you’re storing keys in SSM)
variable "store_access_keys_in_ssm" {
  type        = bool
  default     = false
}
variable "ssm_path_prefix" {
  type        = string
  default     = "/iam/user-keys"
}
