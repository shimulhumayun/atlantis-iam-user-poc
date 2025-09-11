
resource "null_resource" "access_request_REQ-20250911-9195C98A" {
  triggers = {
    request_id = "REQ-20250911-9195C98A"
    user_email = "jane.smith@company.com"
    resource_type = "database"
    resource_id = "test"
    justification = "ttttttttttttttttttttttttttt"
  }
}
