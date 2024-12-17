#!/usr/bin/env bash

# Pre-commit hook to remove trailing whitespaces and format shell scripts

echo "Running pre-commit hook: Removing trailing whitespaces and formatting..."

# Find all shell scripts staged for commit
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.sh$')

# Exit early if no shell scripts are staged
if [ -z "$STAGED_FILES" ]; then
	echo "No shell scripts staged. Skipping formatting."
	exit 0
fi

# Remove trailing whitespaces and format each shell script
for file in $STAGED_FILES; do
	if [ -f "$file" ]; then
		echo "Processing $file..."

		# Remove trailing whitespaces
		sed -i 's/[ \t]*$//' "$file"

		# Format the file using shfmt
		shfmt -w "$file"

		# Re-add the cleaned file to the staging area
		git add "$file"
	fi
done

echo "Pre-commit checks passed. All files are clean and formatted!"
exit 0
