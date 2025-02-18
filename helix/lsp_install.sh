#!/usr/bin/env bash

set -euo pipefail

echo "Installing Helix Language Servers and Formatters..."

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install npm packages globally
install_npm_package() {
  if ! command_exists "$1"; then
    echo "Installing $1..."
    npm install -g "$1"
  else
    echo "$1 is already installed"
  fi
}

# Function to install pip packages
install_pip_package() {
  echo "Installing $1..."
  pip install --user "$1"
}

# Create a temporary directory for downloads
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Install npm-based language servers
if command_exists npm; then
  # Frontend tooling
  install_npm_package "typescript-language-server"
  install_npm_package "typescript"
  install_npm_package "@tailwindcss/language-server"
  install_npm_package "@biomejs/biome"
  install_npm_package "vscode-langservers-extracted"
else
  echo "npm not found. Please install Node.js and npm first."
  exit 1
fi

# Install Python-based language servers
if command_exists pip; then
  install_pip_package "basedpyright"
  install_pip_package "ruff"
else
  echo "pip not found. Please install Python and pip first."
  exit 1
fi

# Install Rust-based tools
if command_exists cargo; then
  # Install taplo (TOML formatter)
  cargo install taplo-cli --locked

  # Install rust-analyzer
  rustup component add rust-analyzer
else
  echo "cargo not found. Please install Rust first."
  exit 1
fi

# Install shfmt
if command_exists go; then
  go install mvdan.cc/sh/v3/cmd/shfmt@latest
else
  echo "go not found. Please install Go first."
fi

# Install dockerfile-utils if available
if command_exists npm; then
  install_npm_package "dockerfile-utils"
fi

echo "Installation complete! Please restart Helix to use the new language servers."
echo "Run 'hx --health' to verify the installation of language servers."
