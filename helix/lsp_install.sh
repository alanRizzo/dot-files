#!/usr/bin/env bash

set -euo pipefail

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Print colored header
print_header() {
  echo -e "${BLUE}${BOLD}=== $1 ===${NC}"
}

# Print success message
print_success() {
  echo -e "${GREEN}✓ $1${NC}"
}

# Print warning message
print_warning() {
  echo -e "${YELLOW}⚠ $1${NC}"
}

# Print error message
print_error() {
  echo -e "${RED}✗ $1${NC}"
}

# Print info message
print_info() {
  echo -e "${CYAN}ℹ $1${NC}"
}

print_header "Installing Helix Language Servers and Formatters"

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install npm packages globally
install_npm_package() {
  if ! command_exists "$1"; then
    print_info "Installing $1..."
    npm install -g "$1"
    print_success "$1 installed successfully"
  else
    print_info "$1 is already installed"
  fi
}

# Function to install pip packages
install_pip_package() {
  print_info "Installing $1..."
  pip3 install --user "$1"
  print_success "$1 installed successfully"
}

# Create a temporary directory for downloads
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Install npm-based language servers
if command_exists npm; then
  print_header "Installing NPM-based Language Servers"
  # Frontend tooling
  install_npm_package "typescript-language-server"
  install_npm_package "typescript"
  install_npm_package "@tailwindcss/language-server"
  install_npm_package "@biomejs/biome"
  install_npm_package "vscode-langservers-extracted"
else
  print_error "npm not found. Please install Node.js and npm first."
  exit 1
fi

# Install Python-based language servers
if command_exists pip; then
  print_header "Installing Python-based Language Servers"
  install_pip_package "basedpyright"
  install_pip_package "ruff"
else
  print_error "pip not found. Please install Python and pip first."
  exit 1
fi

# Install Rust-based tools
if command_exists cargo; then
  print_header "Installing Rust-based Tools"
  # Install taplo (TOML formatter)
  print_info "Installing taplo-cli..."
  cargo install taplo-cli --locked
  print_success "taplo-cli installed successfully"

  # Install rust-analyzer
  print_info "Installing rust-analyzer..."
  rustup component add rust-analyzer
  print_success "rust-analyzer installed successfully"
else
  print_error "cargo not found. Please install Rust first."
  exit 1
fi

# Install shfmt using Homebrew
if command_exists brew; then
  print_header "Installing Shell Formatter"
  if ! command_exists shfmt; then
    print_info "Installing shfmt..."
    brew install shfmt
    print_success "shfmt installed successfully"
  else
    print_info "shfmt is already installed"
  fi
else
  print_warning "brew not found. shfmt will not be installed. Please install Homebrew first if you need shell formatting."
fi

# Install dockerfile-utils if available
if command_exists npm; then
  print_header "Installing Dockerfile Tools"
  install_npm_package "dockerfile-utils"
fi

print_header "Installation Complete!"
print_success "All language servers have been installed successfully"
print_info "Please restart Helix to use the new language servers"
print_info "Run 'hx --health' to verify the installation of language servers"
