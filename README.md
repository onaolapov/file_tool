Here’s the updated **`README.md`** with all references to **Git worktree** removed while keeping the content clean and organized:

---

## **README.md**

```markdown
# File Manipulation CLI Tool

## **Overview**

The **File Manipulation CLI Tool** is a lightweight, versatile command-line utility designed to perform essential file operations. It supports interactive user input for convenience and command-line automation for use in scripts, pipelines, and workflows.

### **Supported Operations**
1. **Create**: Create a file with optional text content.  
2. **Copy**: Copy a file to a new location.  
3. **Combine**: Merge the contents of two files into a third file.  
4. **Delete**: Delete a specified file.  

---

## **Features**

- **Interactive Mode**: Follow on-screen prompts to perform operations.  
- **Command-Line Automation**: Execute operations directly with arguments for scripting.  
- **Automated Testing**: Unit and integration tests ensure tool reliability.  
- **Vulnerability Scanning**: Integrated security checks during CI/CD pipelines.  
- **CI/CD Pipeline**: Automates testing, building, tagging versions, and artifact uploads.  
- **Portable Installation**: Build and install the tool system-wide.  

---

## **Project Directory Structure**

Below is the structure of the project repository:

```plaintext
.
├── file_tool.sh             # Main CLI script for file operations
├── file_tool.tar.gz         # Packaged tarball of the tool
├── install.sh               # Script to install the tool system-wide
├── Makefile                 # Automates build, install, test, and clean processes
├── README.md                # Documentation for the tool
├── t2                       # Example test artifact
├── t3                       # Example test artifact
└── tests/                   # Test scripts and configurations
    ├── integration_tests.sh # Integration tests for workflows
    ├── test_config.sh       # Configuration for test variables
    └── unit_tests.sh        # Unit tests for individual operations
```

**Files and Directories**:
- **`file_tool.sh`**: The main Bash script that provides all operations.
- **`tests/`**: Contains automated tests and configurations.
- **`Makefile`**: Provides commands for building, testing, and cleaning the project.
- **`install.sh`**: Installs the tool to `/usr/local/bin` for system-wide use.
- **`README.md`**: Documentation for usage and contribution.

---

## **CI/CD Workflow**

The project includes a GitHub Actions workflow that automates the following:

1. **Testing**:
   - Runs unit and integration tests using `make test`.
2. **Build**:
   - Packages the tool into a `file_tool.tar.gz` tarball.
3. **Vulnerability Scanning**:
   - Scans the repository and artifacts for security vulnerabilities using `Trivy` and lints shell scripts with `ShellCheck`.
4. **Version Tagging**:
   - Automatically increments the version (e.g., `v1.0.0` → `v1.0.1`) and tags the repository.
5. **Artifact Upload**:
   - Uploads the built tarball as an artifact for download.

### **Triggers**:
- On push or pull requests to the `main` branch.  
- Manual trigger via GitHub Actions UI.

---

## **Installation**

### **Steps to Install**

1. Clone the repository:
   ```bash
   git clone <repository-url>
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

The tool will now be available as `file_tool` in `/usr/local/bin`.

---

## **Usage**

### **1. Interactive Mode**

Run the tool without any arguments:
```bash
file_tool
```
Follow the on-screen prompts to perform file operations.

---

### **2. Command-Line Mode**

| **Operation**             | **Command Syntax**                          |
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

## **Testing**

### **Run Automated Tests**
To execute all tests:
```bash
make test
```

### **Testing Includes**:
- **Unit Tests**: Verifies individual file operations.  
- **Integration Tests**: Simulates combined workflows involving multiple operations.  
- **Vulnerability Scanning**: Ensures scripts and artifacts are secure.

---

## **Build Instructions**

To package the tool into a tarball:
```bash
make build
```

---

## **Cleanup**

To clean up generated files and test artifacts:
```bash
make clean
```

---

## **CI/CD Pipeline Workflow**

The CI/CD pipeline automates:
1. Testing (unit, integration, and security).
2. Building the tool.
3. Running vulnerability scans with **Trivy**.
4. Linting shell scripts with **ShellCheck**.
5. Tagging new versions based on semantic versioning.
6. Uploading the build artifact as `file_tool.tar.gz`.

---

## **License**

This project is licensed under the **MIT License**.

---

## **Credits**

- **Author**: [Your Name]  
- **Version**: 1.0.0  
- **Tools Used**: Bash, GitHub Actions, Trivy, ShellCheck  

---

## **Contributing**

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new feature branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push to your branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

---

## **Support**

For issues or feature requests, please open an issue on the GitHub repository.

---

This version removes all references to Git worktrees, keeping the documentation clean and concise while maintaining all other relevant details. Let me know if you need any further refinements! 🚀# file_tool
