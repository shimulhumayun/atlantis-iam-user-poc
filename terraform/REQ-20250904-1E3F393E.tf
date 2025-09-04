
resource "null_resource" "access_request_REQ-20250904-1E3F393E" {
  triggers = {
    request_id = "REQ-20250904-1E3F393E"
    user_email = "jane.smith@company.com"
    resource_type = "snowflake_new_account"
    resource_id = "h.shimul921@gmail.com"
    justification = "hello world this is a nother"
  }
}
