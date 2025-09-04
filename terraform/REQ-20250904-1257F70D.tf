
resource "null_resource" "access_request_REQ-20250904-1257F70D" {
  triggers = {
    request_id = "REQ-20250904-1257F70D"
    user_email = "jane.smith@company.com"
    resource_type = "snowflake_new_account"
    resource_id = "h.shimul921@gmail.com"
    justification = "this is a new request"
  }
}
