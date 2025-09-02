#########################
# Users
#########################
resource "aws_iam_user" "this" {
  for_each = var.users
  name     = each.value.name
  tags     = merge({ created_by = "atlantis-poc" }, try(each.value.tags, {}))
}

#########################
# Managed policy attachments
#########################
locals {
  policy_attachments = flatten([
    for k, cfg in var.users : [
      for pol in try(cfg.policies, []) : {
        user_key   = k          # map key
        policy_arn = pol
      }
    ]
  ])
}

resource "aws_iam_user_policy_attachment" "managed" {
  for_each   = { for pa in local.policy_attachments : "${pa.user_key}:${pa.policy_arn}" => pa }
  user       = aws_iam_user.this[each.value.user_key].name
  policy_arn = each.value.policy_arn
}

