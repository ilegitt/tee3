#!/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <region1> [region2 ...]"
  exit 1
fi
for region in "$@"; do
  ws="ws-${region}"
  if ! terraform workspace list | grep -q "$ws"; then
    terraform workspace new "$ws"
  fi
  terraform workspace select "$ws"
  terraform init -backend-config="key=${ws}/terraform.tfstate"
  terraform apply -auto-approve -var="aws_region=$region" -var-file="terraform.tfvars"
done
