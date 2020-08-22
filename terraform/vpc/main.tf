module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.namespace}-${var.name}"
  cidr = var.vpc_cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  public_subnets = var.public_subnet_cidrs

  enable_ipv6 = true
}