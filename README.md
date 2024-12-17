---

## **Overview**

The **File Manipulation CLI Tool** is a lightweight, versatile command-line utility designed to perform essential file operations on a Linux system. It supports both interactive user input and command-line automation for seamless integration into scripts, CI/CD pipelines, and workflows.

---

## **Features**

- **File Operations**:

   - **Create**: Create a file with optional text content.
   - **Copy**: Copy a file to a new location.
   - **Combine**: Merge the contents of two files into a third file.
   - **Delete**: Delete a specified file.

- **Interactive Mode**: Run the tool interactively and follow prompts.
- **Command-Line Automation**: Execute commands directly with arguments.
- **Automated Testing**: Includes unit and integration tests for reliability.
- **CI/CD Pipeline**: Automates testing, building, and version tagging with GitHub Actions.
- **Vulnerability Scanning**: Security checks using `make scan` (ShellCheck).
- **Portable Installation**: Simple setup with a `Makefile` and installation script.
- **Pre-Commit Hook**: Ensures shell scripts are free of trailing whitespace and properly formatted.

---

## **Table of Contents**

1. [Installation](#installation)  
2. [Usage](#usage)  
3. [Project Structure](#project-structure)  
4. [Testing](#testing)  
5. [CI/CD Pipeline](#cicd-pipeline)  
6. [Pre-Commit Hook](#pre-commit-hook)  
7. [Contributing](#contributing)  
8. [License](#license)  

---

## **Installation**

Follow these steps to install the tool:

### **Requirements**

- Ubuntu (Debian-based system)
- Bash version 4.0 or later
- ShellCheck (for formatting and linting)

Install ShellCheck if not already installed:

```bash
sudo apt-get update
sudo apt-get install shellcheck
```

---

### **Steps**

1. Clone the repository:
   ```bash
   git clone https://github.com/onaolapov/file_tool.git
   cd file_tool
   ```

2. Build the tool:
   ```bash
   make build
   ```

3. Install system-wide:
   ```bash
   sudo make install
   ```

4. Verify installation:
   ```bash
   file_tool --help
   ```

---

## **Usage**

You can run the tool in **interactive mode** or provide **command-line arguments** for automation.

### **1. Interactive Mode**

Run the tool without arguments:
```bash
file_tool
```
Follow the on-screen prompts to perform file operations.

---

### **2. Command-Line Mode**

| __Operation__             | __Command Syntax__                          |
|---------------------------|---------------------------------------------|
| Create a file             | `file_tool create <filename> [text]`       |
| Copy a file               | `file_tool copy <source> <destination>`    |
| Combine two files         | `file_tool combine <file1> <file2> <output>` |
| Delete a file             | `file_tool delete <filename>`              |

---

### **Examples**

- **Create a file**:
   ```bash
   file_tool create example.txt "Hello World"
   ```

- **Copy a file**:
   ```bash
   file_tool copy example.txt backup.txt
   ```

- **Combine two files**:
   ```bash
   file_tool combine file1.txt file2.txt combined.txt
   ```

- **Delete a file**:
   ```bash
   file_tool delete example.txt
   ```

---

## **Project Structure**

The project is organized as follows:

```plaintext
file_tool/
├── pre-commit.sh          # Pre-commit hook script
├── src/                   # Source code directory
│   └── file_tool.sh       # Main CLI script
├── tests/                 # Test scripts
│   ├── unit_tests.sh      # Unit tests
│   ├── integration_tests.sh # Integration tests
│   └── test_config.sh     # Test configuration variables
├── .github/               # CI/CD workflows
│   └── workflows/
│       └── ci-cd.yml      # GitHub Actions CI/CD pipeline
├── Makefile               # Build, test, and clean automation
├── install.sh             # Installation script
├── LICENSE                # License file
├── CHANGELOG.md           # Change history
└── README.md              # Project documentation
```

---

## **Testing**

Automated tests include unit and integration tests to ensure reliability.

### **Run All Tests**

To execute tests:
```bash
make test
```

### **Run Vulnerability Scan**

The `make scan` target ensures your shell scripts are free of syntax errors and vulnerabilities using **ShellCheck**.

```bash
make scan
```

**Output**: If there are issues, they will be reported as warnings, but the pipeline will proceed.

---

## **CI/CD Pipeline**

The project includes a GitHub Actions pipeline that automates:

1. **Testing**: Runs unit and integration tests.  
2. **Building**: Packages the tool into `file_tool.tar.gz`.  
3. **Vulnerability Scanning**: Runs `make scan` to check for shell script issues using ShellCheck.  
4. **Version Tagging**: Automatically increments the version and tags the repository.  
5. **Artifact Upload**: Uploads the built tarball for download.

---

## **Pre-Commit Hook**

To ensure clean and well-formatted shell scripts, a **pre-commit hook** is included.

### **What It Does**
- Removes trailing whitespaces.
- Formats shell scripts using ShellCheck and `shfmt`.

### **Setup Instructions**

1. **Ensure `ShellCheck` and `shfmt` are installed**:
   ```bash
   sudo apt-get install shellcheck
   sudo apt-get install shfmt
   ```

2. **Set up the pre-commit hook**:
   Link the `pre-commit.sh` file in the root to `.git/hooks/pre-commit`:
   ```bash
   ln -sf ../../pre-commit.sh .git/hooks/pre-commit
   ```

3. **Make the script executable**:
   ```bash
   chmod +x pre-commit.sh
   ```

4. **Verify the hook**:
   - Modify a shell script (e.g., add trailing spaces).
   - Stage and commit:
     ```bash
     git add file_tool.sh
     git commit -m "Test pre-commit hook"
     ```

5. **Output Example**:
   ```plaintext
   Running pre-commit hook: Removing trailing whitespaces and formatting...
   Processing file_tool.sh...
   Pre-commit checks passed. All files are clean and formatted!
   ```

---

## **Contributing**

Contributions are welcome! Follow these steps:

1. Fork the repository.
2. Clone the project locally:
   ```bash
   git clone https://github.com/<your-username>/file_tool.git
   ```
3. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
4. Make changes and commit:
   ```bash
   git commit -m "Add feature-name"
   ```
5. Push to your fork:
   ```bash
   git push origin feature-name
   ```
6. Open a Pull Request.

---

## **License**

This project is licensed under the [MIT License](LICENSE).

---

## **Version History**

### **[1.0.0]** - 2024-12-17
- Initial release of the File Manipulation CLI Tool.
- Implemented create, copy, combine, and delete operations.
- Added automated tests, pre-commit hooks, and GitHub Actions CI/CD pipeline.

---

## **Support**

If you encounter any issues, please open an issue on the repository:  
[https://github.com/onaolapov/file_tool/issues](https://github.com/onaolapov/file_tool/issues)

---

## **Acknowledgments**

Special thanks to the open-source community for tools like:
- **ShellCheck**: Shell script linting.
- **GitHub Actions**: CI/CD automation.

---