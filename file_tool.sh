#!/usr/bin/env bash

# File Manipulation CLI Tool
set -e

usage() {
    echo "Usage: $0 {create|copy|combine|delete} [arguments]"
    echo "Interactive Mode: Run the script without arguments."
    exit 1
}

create_file() {
    local file="$1"
    local text="$2"
    echo "$text" > "$file"
    echo "File '$file' created with content: '$text'."
}

copy_file() {
    local src="$1"
    local dest="$2"
    cp "$src" "$dest"
    echo "File '$src' copied to '$dest'."
}

combine_files() {
    local file1="$1"
    local file2="$2"
    local output="$3"
    cat "$file1" "$file2" > "$output"
    echo "Files '$file1' and '$file2' combined into '$output'."
}

delete_file() {
    local file="$1"
    rm -f "$file"
    echo "File '$file' deleted."
}

interactive_mode() {
    while true; do
        echo "Commands: create, copy, combine, delete, exit"
        read -p "Enter a command: " cmd
        case "$cmd" in
            create) read -p "Filename: " file; read -p "Text: " text; create_file "$file" "$text" ;;
            copy) read -p "Source file: " src; read -p "Destination file: " dest; copy_file "$src" "$dest" ;;
            combine) read -p "First file: " f1; read -p "Second file: " f2; read -p "Output file: " out; combine_files "$f1" "$f2" "$out" ;;
            delete) read -p "File to delete: " file; delete_file "$file" ;;
            exit) exit 0 ;;
            *) echo "Invalid command." ;;
        esac
    done
}

if [ $# -eq 0 ]; then
    interactive_mode
else
    case "$1" in
        create) create_file "$2" "$3" ;;
        copy) copy_file "$2" "$3" ;;
        combine) combine_files "$2" "$3" "$4" ;;
        delete) delete_file "$2" ;;
        *) usage ;;
    esac
fi


