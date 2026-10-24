#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ANSIBLE_DIR="$PROJECT_ROOT/ansible"
TERRAFORM_DIR="$PROJECT_ROOT/terraform"
INVENTORY="$ANSIBLE_DIR/inventory-test-generated.ini"

echo "===> Validating Terraform configuration"
terraform -chdir="$TERRAFORM_DIR" validate

echo "===> Generating test inventory"
"$SCRIPT_DIR/generate-test-inventory.sh"

echo "===> Deploying to the test server"
ansible-playbook -i "$INVENTORY" "$ANSIBLE_DIR/survey-builder-test.yml" --ask-vault-pass

echo "===> Checking application health"
TEST_IP="$(terraform -chdir="$TERRAFORM_DIR" output -raw test_public_ip)"

curl \
--fail \
--silent \
--retry 10 \
--retry-delay 3 \
--retry-connrefused \
"http://${TEST_IP}/api/health"

echo
echo "==> Test deployment and health check completed successfully"