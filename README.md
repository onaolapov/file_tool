
---

## **File Manipulation CLI Tool**

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

```bash {"id":"01JFASZ8MXVEBJBGE3A3TSSW29"}
git checkout -b feature-name
```

3. Commit your changes:

```bash {"id":"01JFASZ8N0C15HBDR3EXQBDDVB"}
git commit -m "Add feature-name"
```

4. Push to your branch:

```bash {"id":"01JFASZ8N0C15HBDR3EXWTVNQ5"}
git push origin feature-name
```

5. Open a pull request.

---

## **Support**

For issues or feature requests, please open an issue on the GitHub repository.

---

This version removes all references to Git worktrees, keeping the documentation clean and concise while maintaining all other relevant details. Let me know if you need any further refinements! 🚀# file_tool
