#########################
# Users
#########################
resource "aws_iam_user" "this" {
  for_each = var.users
  name     = each.key
  tags     = merge({ created_by = "atlantis-poc" }, each.value.tags)
}

#########################
# Managed policy attachments
#########################
locals {
  policy_attachments = flatten([
    for uname, cfg in var.users : [
      for pol in cfg.policies : {
        user       = uname
        policy_arn = pol
      }
    ]
  ])
}

resource "aws_iam_user_policy_attachment" "managed" {
  for_each   = { for pa in local.policy_attachments : "${pa.user}:${pa.policy_arn}" => pa }
  user       = aws_iam_user.this[each.value.user].name
  policy_arn = each.value.policy_arn
}

#########################
# Optional access keys
#########################
resource "aws_iam_access_key" "this" {
  for_each = { for uname, cfg in var.users : uname => cfg if cfg.create_access_key }
  user     = aws_iam_user.this[each.key].name
}

# (Optional) Store keys in SSM as SecureString JSON
resource "aws_ssm_parameter" "ak" {
  for_each = var.store_access_keys_in_ssm ? aws_iam_access_key.this : {}

  name  = "${var.ssm_path_prefix}/${each.key}"
  type  = "SecureString"
  value = jsonencode({
    access_key_id     = each.value.id
    secret_access_key = each.value.secret
  })
}
