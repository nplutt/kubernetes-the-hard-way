resource "null_resource" "kubernetes_ami" {
  triggers = {
    always_run = uuid()
  }

  provisioner "local-exec" {
    command = <<EOT
bash ../../packer/kubernetes/build.sh
EOT
    environment = {
      REGION          = var.region
      NAME            = "${var.namespace}-${var.name}"
      NAMESPACE       = var.namespace
      AMI_DESCRIPTION = "Ubuntu based image for running kubernetes cluster"
      INSTANCE_TYPE   = "t3.micro"
      SOURCE_AMI_ID   = data.aws_ami.ubuntu_base.image_id
      SSH_USERNAME    = "ubuntu"
      VPC_ID          = data.terraform_remote_state.vpc.outputs.vpc_id
      SUBNET_ID       = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
    }
  }

}