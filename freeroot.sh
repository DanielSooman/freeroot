#!/bin/bash

# Set up variables
REPO_URL="https://github.com/foxytouxxx/freeroot.git"
REPO_DIR="freeroot"

# Function to handle errors
die() {
    echo "Error: $1" >&2
    exit 1
}

# Clone the repository if it doesn't exist
if [ ! -d "$REPO_DIR" ]; then
    echo "Cloning Foxytoux repository..."
    git clone "$REPO_URL" || die "Failed to clone repository. Check your internet connection."
else
    echo "Repository already exists. Skipping cloning."
fi

# Change to the repository directory
cd "$REPO_DIR" || die "Failed to enter repo directory."

# Run the installer script without user prompts
if [ -f "root.sh" ]; then
    echo "Running the installation script..."
    chmod +x root.sh || die "Failed to make root.sh executable."
    yes | ./root.sh || die "Installation script encountered an error."
else
    die "root.sh not found!"
fi
