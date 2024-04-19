#!/bin/bash

# This script is use to configure a cloned repository with a local git config automatically

# Check if a repository URL was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <repository-url>"
    exit 1
fi

REPO_URL=$1

# Extract the repository name from the URL
REPO_NAME=$(basename -s .git "$REPO_URL")

# Clone the repository
git clone "$REPO_URL"

# Check if the clone was successful
if [ ! -d "$REPO_NAME" ]; then
    echo "Failed to clone repository."
    exit 1
fi

# Navigate into the repository directory
cd "$REPO_NAME"

# Set local Git configurations
git config --local user.name "User Name"
git config --local user.email "user@example.com"

echo "Local Git configuration set for $REPO_NAME"
