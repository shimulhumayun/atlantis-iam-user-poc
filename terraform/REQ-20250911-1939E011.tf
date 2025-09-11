
resource "null_resource" "access_request_REQ-20250911-1939E011" {
  triggers = {
    request_id = "REQ-20250911-1939E011"
    user_email = "jane.smith@company.com"
    resource_type = "database"
    resource_id = "trytyty"
    justification = "tytytytytytytytytytytyty"
  }
}
