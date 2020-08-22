module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.tf_state_bucket
  acl    = "private"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
     rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "AES256"
      }
    }
  }
}

module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = var.tf_state_table
  hash_key = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
  server_side_encryption_enabled = true
}