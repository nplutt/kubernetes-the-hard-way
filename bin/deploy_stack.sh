#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
PROJECT_ROOT="${SCRIPT_DIR}/.."

MODULES=(
    "vpc"
    "ami"
    "iam"
)


for MODULE in "${MODULES[@]}"
do
    echo "Deploying $MODULE..."
    cd ${PROJECT_ROOT}/terraform/${MODULE}
    bash ${PROJECT_ROOT}/bin/terraform_deploy.sh -auto-approve
done