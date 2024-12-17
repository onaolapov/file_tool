# #!/usr/bin/env bash
# set -e

# # Source test configuration
# CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/test_config.sh"
# . "$CONFIG_FILE"

# # Locate file_tool.sh
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
# FILE_TOOL="$SCRIPT_DIR/file_tool.sh"

# echo "Running Integration Tests..."

# # Step 1: Create test files
# "$FILE_TOOL" create "$TEST_FILE1" "$TEST_CONTENT1"
# "$FILE_TOOL" create "$TEST_FILE2" "$TEST_CONTENT2"

# # Step 2: Combine files
# "$FILE_TOOL" combine "$TEST_FILE1" "$TEST_FILE2" "$COMBINED_FILE"
# grep "$TEST_CONTENT1" "$COMBINED_FILE" && grep "$TEST_CONTENT2" "$COMBINED_FILE" && echo "Combine Test Passed"

# # Step 3: Copy combined file
# "$FILE_TOOL" copy "$COMBINED_FILE" "$COPY_FILE"
# [ -f "$COPY_FILE" ] && echo "Copy Test Passed"

# # Step 4: Cleanup
# "$FILE_TOOL" delete "$TEST_FILE1"
# "$FILE_TOOL" delete "$TEST_FILE2"
# "$FILE_TOOL" delete "$COMBINED_FILE"
# "$FILE_TOOL" delete "$COPY_FILE"
# [ ! -f "$TEST_FILE1" ] && [ ! -f "$TEST_FILE2" ] && [ ! -f "$COMBINED_FILE" ] && [ ! -f "$COPY_FILE" ] && echo "Cleanup Test Passed"

# echo "Integration Tests Passed!"


#!/usr/bin/env bash
set -e

# shellcheck source=tests/test_config.sh
CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/test_config.sh"
. "$CONFIG_FILE"

# Locate file_tool.sh dynamically
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
FILE_TOOL="$SCRIPT_DIR/file_tool.sh"

if [ ! -f "$FILE_TOOL" ]; then
    echo "Error: file_tool.sh not found in $SCRIPT_DIR"
    exit 1
fi

echo "Running Integration Tests..."

# Step 1: Create test files
echo "Creating test files..."
"$FILE_TOOL" create "$TEST_FILE1" "$TEST_CONTENT1"
"$FILE_TOOL" create "$TEST_FILE2" "$TEST_CONTENT2"

# Step 2: Verify file creation
if grep -q "$TEST_CONTENT1" "$TEST_FILE1" && grep -q "$TEST_CONTENT2" "$TEST_FILE2"; then
    echo "File creation test passed!"
else
    echo "File creation test failed!" >&2
    exit 1
fi

# Step 3: Combine files
echo "Combining files..."
"$FILE_TOOL" combine "$TEST_FILE1" "$TEST_FILE2" "$COMBINED_FILE"

# Verify combined file
if grep -q "$TEST_CONTENT1" "$COMBINED_FILE" && grep -q "$TEST_CONTENT2" "$COMBINED_FILE"; then
    echo "File combine test passed!"
else
    echo "File combine test failed!" >&2
    exit 1
fi

# Step 4: Copy combined file
echo "Copying combined file..."
"$FILE_TOOL" copy "$COMBINED_FILE" "$COPY_FILE"

# Verify file copy
if [ -f "$COPY_FILE" ]; then
    echo "File copy test passed!"
else
    echo "File copy test failed!" >&2
    exit 1
fi

# Step 5: Delete all files
echo "Deleting files..."
"$FILE_TOOL" delete "$TEST_FILE1"
"$FILE_TOOL" delete "$TEST_FILE2"
"$FILE_TOOL" delete "$COMBINED_FILE"
"$FILE_TOOL" delete "$COPY_FILE"

# Verify deletion
if [ ! -f "$TEST_FILE1" ] && [ ! -f "$TEST_FILE2" ] && [ ! -f "$COMBINED_FILE" ] && [ ! -f "$COPY_FILE" ]; then
    echo "File deletion test passed!"
else
    echo "File deletion test failed!" >&2
    exit 1
fi

echo "All Integration Tests Passed Successfully!"
