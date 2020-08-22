output kubernetes_ami_prefix {
  value = "${var.namespace}-${var.name}-*"
}