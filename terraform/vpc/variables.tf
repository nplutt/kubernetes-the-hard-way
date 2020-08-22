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

variable namespace {
  type = string
  description = "The namespace to launch the resource into"
}

variable name {
  type = string
  description = "The name of the resource"
}

variable vpc_cidr {
  type = string
  description = "The cidr block to assign to the vpc"
}

variable public_subnet_cidrs {
  type = list(string)
  description = "A list of cidr blocks to use for the public subnets"
}