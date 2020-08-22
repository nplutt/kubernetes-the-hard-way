data "terraform_remote_state" "vpc" {
  backend   = "s3"
  config = {
    bucket         = var.tf_state_bucket
    region         = var.region
    key            = "vpc/terraform.tfstate"
  }
}

data "aws_ami" "ubuntu_base" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}
