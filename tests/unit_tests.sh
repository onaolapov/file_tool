#!/usr/bin/env bash
set -e

# Source test configuration
CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/test_config.sh"
# shellcheck source=tests/test_config.sh
. "$CONFIG_FILE"

# Locate file_tool.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
FILE_TOOL="$SCRIPT_DIR/file_tool.sh"

echo "Running Unit Tests..."

# Test 1: Create file
"$FILE_TOOL" create "$TEST_FILE1" "$TEST_CONTENT1"
grep -q "$TEST_CONTENT1" "$TEST_FILE1" && echo "Create Test Passed"

# Test 2: Copy file
"$FILE_TOOL" copy "$TEST_FILE1" "$COPY_FILE"
[ -f "$COPY_FILE" ] && echo "Copy Test Passed"

# Test 3: Combine files
"$FILE_TOOL" combine "$TEST_FILE1" "$COPY_FILE" "$COMBINED_FILE"
grep -q "$TEST_CONTENT1" "$COMBINED_FILE" && echo "Combine Test Passed"

# Test 4: Delete files
"$FILE_TOOL" delete "$TEST_FILE1"
"$FILE_TOOL" delete "$COPY_FILE"
"$FILE_TOOL" delete "$COMBINED_FILE"

[ ! -f "$TEST_FILE1" ] && [ ! -f "$COPY_FILE" ] && [ ! -f "$COMBINED_FILE" ] && echo "Delete Test Passed"

echo "All Unit Tests Passed!"
