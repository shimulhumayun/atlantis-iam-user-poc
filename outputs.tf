output "created_usernames" {
  value       = keys(aws_iam_user.this)
  description = "All usernames created by this stack."
}

output "access_key_ids" {
  value       = { for k, v in aws_iam_access_key.this : k => v.id }
  description = "Access key IDs (no secrets). Secrets are stored in state and optionally SSM."
  sensitive   = true
}
