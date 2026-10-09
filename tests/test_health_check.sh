
#!/usr/bin/env bash

set -euo pipefail

SCRIPT="scripts/health_check.sh"

echo "Test 1: Checking script exists"
test -f "$SCRIPT"

echo "Test 2: Checking Bash syntax"
bash -n "$SCRIPT"

echo "Test 3: Running health check"
bash "$SCRIPT" > /tmp/health-check-output.txt

echo "Test 4: Checking expected output"
grep -q "UBUNTU HEALTH CHECK" /tmp/health-check-output.txt
grep -q "Memory Usage:" /tmp/health-check-output.txt
grep -q "Disk Usage:" /tmp/health-check-output.txt

echo "PASS: All health-check tests passed"
