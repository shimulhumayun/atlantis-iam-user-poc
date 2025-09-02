users = {
  "demo.user.001" = {
    policies          = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    tags              = { team = "platform" }
    create_access_key = false
  }
  "demo.user.002" = {
    policies          = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
    ]
    tags              = { team = "data" }
    create_access_key = true
  }
}

# Optional:
# store_access_keys_in_ssm = true
# ssm_path_prefix = "/iam/user-keys"
