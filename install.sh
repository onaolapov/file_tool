#!/usr/bin/env bash
set -e

echo "Installing File Manipulation CLI Tool..."
chmod +x file_tool.sh
sudo cp file_tool.sh /usr/local/bin/file_tool
echo "Tool installed as 'file_tool'."
