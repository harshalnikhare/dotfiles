#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Running setup scripts..."

bash "$SCRIPT_DIR/conty.sh"
bash "$SCRIPT_DIR/tpm.sh"

echo "All setup complete"
