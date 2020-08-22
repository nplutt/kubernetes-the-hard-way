variable region {
  type        = string
  description = "The name of the region that the resource is being launched into."
}

variable tf_state_bucket {
  type = string
  description = "The name of the S3 bucket used to store the terraform state"
}

variable tf_state_table {
  type = string
  description = "The name of the DynamoDB table used to lock the terraform state"
}