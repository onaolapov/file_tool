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


.PHONY: all build install test clean scan

all: build

build:
	tar -czf file_tool.tar.gz file_tool.sh install.sh tests/

install:
	chmod +x install.sh
	./install.sh

test:
	chmod +x file_tool.sh tests/unit_tests.sh tests/integration_tests.sh tests/test_config.sh
	bash ./tests/unit_tests.sh
	bash ./tests/integration_tests.sh

scan:
	@echo "Running ShellCheck for vulnerability and syntax scan..."
	@find . -name "*.sh" -exec shellcheck {} +
	@echo "ShellCheck scan completed successfully!"

clean:
	rm -f file_tool.tar.gz testfile1.txt testfile2.txt copyfile.txt combined_file.txt
