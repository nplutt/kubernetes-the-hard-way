# kubernetes-the-hard-way
An AWS based follow through of Kelsey Hightower's Kubernetes the Hard Way [repo](https://github.com/kelseyhightower/kubernetes-the-hard-way)
using infrastructure as code & automation.

## Quick start
1. Create a `.env` file:
```bash
export TF_VAR_region=your-aws-region
export TF_VAR_namespace=your-namespace
export TF_VAR_tf_state_bucket=${TF_VAR_namespace}-terraform-state
export TF_VAR_tf_state_table=${TF_VAR_namespace}-terraform-state

alias deploy-module='bash $(git rev-parse --show-toplevel)/bin/terraform_deploy.sh'
``` 
2. Deploy the stack `bash bin/deploy_stack.sh`