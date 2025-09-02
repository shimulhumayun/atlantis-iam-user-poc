users = {
  u1 = {
    name              = "demouser"
    policies          = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    tags              = { team = "platform" }
    create_access_key = false
  }
  u2 = {
    name              = "dataviewer"
    policies          = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess",
      "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
    ]
    tags              = { team = "data" }
    create_access_key = true
  }
  "test11.at.gmail.com" = {
    policies          = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]
    tags              = { team = "platform" }
    create_access_key = false
  }
}
# store_access_keys_in_ssm = true
# ssm_path_prefix = "/iam/user-keys"
