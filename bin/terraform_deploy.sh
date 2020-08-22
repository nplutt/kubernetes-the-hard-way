#!/usr/bin/env bash

set -e

ADDITIONAL_COMMANDS=$1
SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

source $SCRIPT_DIR/../.env

terraform init \
    -backend-config "region=$TF_VAR_region" \
    -backend-config "bucket=$TF_VAR_tf_state_bucket" \
    -backend-config "dynamodb_table=$TF_VAR_tf_state_table"

terraform apply $ADDITIONAL_COMMANDS