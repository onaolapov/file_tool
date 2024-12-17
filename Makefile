# .PHONY: all build install test clean

# all: build

# build:
# 	tar -czf file_tool.tar.gz file_tool.sh install.sh tests/

# install:
# 	chmod +x install.sh
# 	./install.sh

# test:
# 	chmod +x file_tool.sh tests/unit_tests.sh tests/integration_tests.sh tests/test_config.sh
# 	bash ./tests/unit_tests.sh
# 	bash ./tests/integration_tests.sh

# clean:
# 	rm -f file_tool.tar.gz testfile1.txt testfile2.txt copyfile.txt combined_file.txt


# Define variables
SHELLCHECK := shellcheck
SCAN_DIR := .  # Directory to scan for shell scripts

# Default target
all: test build

# Build the tool
build:
	@echo "Building the tool..."
	tar -czf file_tool.tar.gz file_tool.sh install.sh tests/

# Run unit and integration tests
test:
	@echo "Running all tests..."
	chmod +x tests/unit_tests.sh tests/integration_tests.sh
	./tests/unit_tests.sh
	./tests/integration_tests.sh

# Run ShellCheck for vulnerability scanning
scan:
	@echo "Running ShellCheck for vulnerability scan..."
	find $(SCAN_DIR) -name "*.sh" -exec $(SHELLCHECK) {} +

# Install the tool
install:
	@echo "Installing file_tool system-wide..."
	chmod +x install.sh
	./install.sh

# Clean up build artifacts
clean:
	@echo "Cleaning up..."
	rm -f file_tool.tar.gz
	rm -f tests/testfile*.txt
	rm -f tests/copyfile*.txt
	rm -f tests/combined_file.txt
