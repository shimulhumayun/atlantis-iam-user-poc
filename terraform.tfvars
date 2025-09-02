users = {
  u1 = {
    name              = "demo user"
    policies          = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    tags              = { team = "platform" }
    create_access_key = false
  }
  u2 = {
    name              = "data viewer"
    policies          = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
    ]
    tags              = { team = "data" }
    create_access_key = true
  }
}
# store_access_keys_in_ssm = true
# ssm_path_prefix = "/iam/user-keys"
