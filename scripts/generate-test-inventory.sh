#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TERRAFORM_DIR="$PROJECT_ROOT/terraform"
ANSIBLE_DIR="$PROJECT_ROOT/ansible"

TF_OUTPUT="$(terraform -chdir="$TERRAFORM_DIR" output -json)"

TEST_IP="$(printf '%s' "$TF_OUTPUT" | python3 -c '
import json
import sys

outputs = json.load(sys.stdin)
print(outputs["test_public_ip"]["value"])'
)"

# Generate a separate inventory for testing
INVENTORY_PATH="$ANSIBLE_DIR/inventory-test-generated.ini"

cat > "$INVENTORY_PATH" <<EOF
[test_servers]
survey-builder-test ansible_host=${TEST_IP} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/aws/barth-aws-dev.pem
EOF

echo "Generated test inventory"
cat "$INVENTORY_PATH"