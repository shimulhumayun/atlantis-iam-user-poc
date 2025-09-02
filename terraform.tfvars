users = {
  "test.user.at.company.com" = {
    policies          = [
      "arn:aws:iam::aws:policy/ReadOnlyAccess"
    ]
    tags              = { team = "platform" }
    create_access_key = false
  }
}
