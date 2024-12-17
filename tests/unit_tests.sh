# #!/usr/bin/env bash
# set -e

# # Source the test configuration file
# CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/test_config.sh"
# if [ ! -f "$CONFIG_FILE" ]; then
#     echo "Error: test_config.sh not found at $CONFIG_FILE"
#     exit 1
# fi
# . "$CONFIG_FILE"

# # Locate file_tool.sh dynamically
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
# FILE_TOOL="$SCRIPT_DIR/file_tool.sh"

# if [ ! -f "$FILE_TOOL" ]; then
#     echo "Error: file_tool.sh not found in $SCRIPT_DIR"
#     exit 1
# fi

# echo "Running Unit Tests..."

# "$FILE_TOOL" create "$TEST_FILE1" "$TEST_CONTENT1"
# grep "$TEST_CONTENT1" "$TEST_FILE1" && echo "Create Test Passed"

# "$FILE_TOOL" copy "$TEST_FILE1" "$COPY_FILE"
# [ -f "$COPY_FILE" ] && echo "Copy Test Passed"

# "$FILE_TOOL" combine "$TEST_FILE1" "$COPY_FILE" "$COMBINED_FILE"
# grep "$TEST_CONTENT1" "$COMBINED_FILE" && echo "Combine Test Passed"

# "$FILE_TOOL" delete "$TEST_FILE1"
# "$FILE_TOOL" delete "$COPY_FILE"
# "$FILE_TOOL" delete "$COMBINED_FILE"

# [ ! -f "$TEST_FILE1" ] && [ ! -f "$COPY_FILE" ] && [ ! -f "$COMBINED_FILE" ] && echo "Delete Test Passed"

# echo "All Unit Tests Passed!"
#!/usr/bin/env bash
set -e

# Load test configuration
# shellcheck source=tests/test_config.sh
CONFIG_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/test_config.sh"
. "$CONFIG_FILE"

# Set AUTOMATED_INPUT mode for testing
export AUTOMATED_INPUT=true

# Predefine input values for testing
export cmd="create"
export file="$TEST_FILE1"
export text="$TEST_CONTENT1"

# Run file_tool.sh with automated inputs
../file_tool.sh

# Verify the file was created
if grep -q "$TEST_CONTENT1" "$TEST_FILE1"; then
    echo "File creation test passed."
else
    echo "File creation test failed." >&2
    exit 1
fi
