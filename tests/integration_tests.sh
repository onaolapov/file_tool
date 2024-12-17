#!/usr/bin/env bash
set -e

# Source test configuration
CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/test_config.sh"
. "$CONFIG_FILE"

# Locate file_tool.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
FILE_TOOL="$SCRIPT_DIR/file_tool.sh"

echo "Running Integration Tests..."

# Step 1: Create test files
"$FILE_TOOL" create "$TEST_FILE1" "$TEST_CONTENT1"
"$FILE_TOOL" create "$TEST_FILE2" "$TEST_CONTENT2"

# Step 2: Combine files
"$FILE_TOOL" combine "$TEST_FILE1" "$TEST_FILE2" "$COMBINED_FILE"
grep "$TEST_CONTENT1" "$COMBINED_FILE" && grep "$TEST_CONTENT2" "$COMBINED_FILE" && echo "Combine Test Passed"

# Step 3: Copy combined file
"$FILE_TOOL" copy "$COMBINED_FILE" "$COPY_FILE"
[ -f "$COPY_FILE" ] && echo "Copy Test Passed"

# Step 4: Cleanup
"$FILE_TOOL" delete "$TEST_FILE1"
"$FILE_TOOL" delete "$TEST_FILE2"
"$FILE_TOOL" delete "$COMBINED_FILE"
"$FILE_TOOL" delete "$COPY_FILE"
[ ! -f "$TEST_FILE1" ] && [ ! -f "$TEST_FILE2" ] && [ ! -f "$COMBINED_FILE" ] && [ ! -f "$COPY_FILE" ] && echo "Cleanup Test Passed"

echo "Integration Tests Passed!"
