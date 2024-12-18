---

# **File Manipulation CLI Tool**

[![CI/CD Pipeline](https://github.com/onaolapov/file_tool/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/onaolapov/file_tool/actions)  
[![ShellCheck](https://img.shields.io/badge/Linter-ShellCheck-green?logo=gnu-bash&style=flat-square)](https://github.com/koalaman/shellcheck)  
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)  
[![Platform](https://img.shields.io/badge/Platform-Ubuntu-informational?style=flat-square&logo=ubuntu)](https://ubuntu.com)  
[![Version](https://img.shields.io/badge/Version-1.0.0-brightgreen.svg)](https://github.com/onaolapov/file_tool/releases)

---

## **Overview**

The **File Manipulation CLI Tool** is a robust, versatile command-line utility for performing essential file operations on Linux systems. Designed with **reliability** and **automation** in mind, it seamlessly supports interactive usage, command-line scripting, and modern CI/CD workflows.

---

## **Features** 🚀

- 🗂️ **File Operations**: 
   - 📄 **Create**: Create a file with optional text content.
   - 🔄 **Copy**: Copy a file to a new location.
   - 🔗 **Combine**: Merge two files into a third file.
   - 🗑️ **Delete**: Remove a specified file.
- 🖥️ **Interactive Mode**: User-friendly prompts for file operations.
- 🤖 **Automation Ready**: Supports direct command-line execution for scripting.
- ✅ **Automated Testing**: Unit and integration tests ensure reliability.
- 🔍 **Vulnerability Scanning**: Uses **ShellCheck** for security checks.
- 🔄 **CI/CD Pipeline**: Builds, tests, scans, and tags releases automatically.
- 🧹 **Pre-Commit Hook**: Ensures scripts are clean and formatted before committing.

---

## **Table of Contents** 📚

1. [Installation](#installation)
2. [Usage](#usage)
3. [Testing](#testing)
4. [Pre-Commit Hook](#pre-commit-hook)
5. [CI/CD Pipeline](#cicd-pipeline)
6. [Project Structure](#project-structure)
7. [Contributing](#contributing)
8. [License](#license)
9. [Support](#support)

---

## **Installation** ⚙️

### **Requirements**

- **Linux System** (Ubuntu 22.04+)
- **Bash** (Version 4.0 or later)
- **ShellCheck** (for vulnerability scanning)

Install ShellCheck if not already installed:

```bash
sudo apt-get update
sudo apt-get install shellcheck
```

---

### **Steps to Install**

1. Clone the repository:

   ```bash
   git clone https://github.com/onaolapov/file_tool.git
   cd file_tool
   ```

2. Build the tool:

   ```bash
   make build
   ```

3. Install the tool system-wide:

   ```bash
   sudo make install
   ```

4. Verify the installation:

   ```bash
   file_tool --help
   ```

---

## **Usage** 🛠️

You can run the tool in **interactive mode** or provide **command-line arguments** for automation.

### **Interactive Mode**

Run the tool without arguments to enter interactive mode:

```bash
file_tool
```

---

### **Command-Line Mode**

| **Operation**       | **Syntax**                              | **Example**                              |
|----------------------|----------------------------------------|-----------------------------------------|
| 📄 **Create a file** | `file_tool create <file> [content]`    | `file_tool create example.txt "Hello!"` |
| 🔄 **Copy a file**   | `file_tool copy <src> <dest>`          | `file_tool copy example.txt backup.txt` |
| 🔗 **Combine files** | `file_tool combine <f1> <f2> <output>` | `file_tool combine f1.txt f2.txt output.txt` |
| 🗑️ **Delete a file** | `file_tool delete <file>`              | `file_tool delete example.txt`          |

---

## **Testing** ✅

Run automated tests to verify the tool's reliability.

### **Run All Tests**

```bash
make test
```

### **Run Vulnerability Scan**

Scan for script issues using **ShellCheck**:

```bash
make scan
```

---

## **Pre-Commit Hook** 🔒

A **pre-commit hook** is included to ensure scripts are clean and properly formatted before committing.

### **Setup Instructions**

1. Install ShellCheck and `shfmt`:

   ```bash
   sudo apt-get install shellcheck shfmt
   ```

2. Set up the hook:

   ```bash
   ln -sf ../../pre-commit.sh .git/hooks/pre-commit
   chmod +x pre-commit.sh
   ```

3. Verify it works by staging and committing a script.

---

## **CI/CD Pipeline** 🔄

The GitHub Actions pipeline automates the following:

1. **Testing**: Runs unit and integration tests.
2. **Building**: Packages the tool into `file_tool.tar.gz`.
3. **Vulnerability Scanning**: Runs `make scan` for ShellCheck validation.
4. **Version Tagging**: Auto-increments version tags.
5. **Artifact Upload**: Uploads build artifacts for releases.

To trigger the pipeline:
- Push to the `main` branch.
- Open a Pull Request.

---

## **Project Structure** 📂

```plaintext
file_tool/
├── pre-commit.sh          # Pre-commit hook script
├── src/                   # Source code directory
│   └── file_tool.sh       # Main CLI script
├── tests/                 # Test scripts
│   ├── unit_tests.sh      # Unit tests
│   ├── integration_tests.sh # Integration tests
│   └── test_config.sh     # Test configuration
├── .github/               # CI/CD workflows
│   └── workflows/
│       └── ci-cd.yml      # GitHub Actions pipeline
├── Makefile               # Build, test, and clean automation
├── install.sh             # Installation script
├── LICENSE                # License file
├── CHANGELOG.md           # Change history
└── README.md              # Project documentation
```

---

## **Contributing** 🤝

Contributions are welcome! Follow these steps:

1. Fork the repository.
2. Clone your fork locally:
   ```bash
   git clone https://github.com/<your-username>/file_tool.git
   cd file_tool
   ```
3. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
4. Make changes, commit, and push:
   ```bash
   git commit -m "Add feature-name"
   git push origin feature-name
   ```
5. Open a Pull Request.

---

## **License** 📄

This project is licensed under the [MIT License](LICENSE).

---

## **Support** 💬

For issues, questions, or suggestions, please open an issue here:  
[**https://github.com/onaolapov/file_tool/issues**](https://github.com/onaolapov/file_tool/issues)

---

## **Acknowledgments** 🌟

- **ShellCheck**: For shell script linting.
- **shfmt**: For formatting scripts.
- **GitHub Actions**: For CI/CD automation.

---
