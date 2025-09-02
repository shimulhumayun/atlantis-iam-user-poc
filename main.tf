resource "aws_iam_user" "poc_user" {
  name = var.user_name
  tags = { created_by = "atlantis-poc" }
}

# (Optional) Attach a basic read-only policy for demo purposes
data "aws_iam_policy" "readonly" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "attach_ro" {
  user       = aws_iam_user.poc_user.name
  policy_arn = data.aws_iam_policy.readonly.arn
}

# (Optional) create an access key (POC only; handle secrets securely in real env)
# resource "aws_iam_access_key" "key" {
#   user = aws_iam_user.poc_user.name
# }
