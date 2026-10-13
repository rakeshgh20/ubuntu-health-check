
#!/usr/bin/env bash

set -euo pipefail

SCRIPT="scripts/health_check.sh"
OUTPUT=$(mktemp)

trap 'rm -f "$OUTPUT"' EXIT

echo "Test 1: Checking script exists"
test -f "$SCRIPT"

echo "Test 2: Checking Bash syntax"
bash -n "$SCRIPT"

echo "Test 3: Running health check"
bash "$SCRIPT" > "$OUTPUT"

echo "Test 4: Checking expected output"
grep -q "UBUNTU HEALTH CHECK" "$OUTPUT"
grep -q "Memory Usage:" "$OUTPUT"
grep -q "Disk Usage:" "$OUTPUT"

echo "All tests passed!"

