terraform {
  backend "s3" {
    bucket         = "atlantis-tf-state-shimul"  # <- change
    key            = "iam-users/terraform.tfstate"
    region         = "us-east-1"                     # <- change if needed
    dynamodb_table = "atlantis-tf-locks"
    encrypt        = true
  }
}
