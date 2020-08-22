#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source $SCRIPT_DIR/../.env

cd $SCRIPT_DIR/../terraform/terraform-state
mv providers.tf /tmp/
cat > providers.tf << EOF
provider "aws" {
  region = var.region
}
EOF

echo "Initializing module..."
terraform init

echo "Deploying module..."
terraform apply

mv /tmp/providers.tf ./
echo "Moving local state to remote..."
terraform init \
    -backend-config "region=$TF_VAR_region" \
    -backend-config "bucket=$TF_VAR_tf_state_bucket" \
    -backend-config "dynamodb_table=$TF_VAR_tf_state_table"
