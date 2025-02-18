# Helix Editor Installation Guide

This guide will help you set up Helix editor with all necessary language servers and formatters for a complete development environment.

## Prerequisites

- Git
- Cargo (Rust's package manager)
- Node.js and npm
- Python 3 and uv

## Basic Installation

### 1. Install Helix

####
```bash
brew install helix
```

### 2. Install Language Servers and Formatters

Run the following script:

```bash
./install-language-servers.sh
```

## Included Language Support

This configuration includes support for:

### Frontend Development
- HTML (with Tailwind CSS support)
- CSS (with Tailwind CSS support)
- JavaScript/TypeScript
- TSX (TypeScript + JSX)
- JSON

### Backend Development
- Python (with basedpyright and ruff)
- Rust (with rust-analyzer)
- YAML (with schema support)

### Configuration Languages
- TOML
- JSON
- YAML

## Configuration

1. Copy the provided `languages.toml` to your Helix config directory:
```bash
mkdir -p ~/.config/helix
cp languages.toml ~/.config/helix/
```

2. Verify the installation:
```bash
hx --health
```

## Troubleshooting

If you encounter any issues:

1. Ensure all prerequisites are installed
2. Check that PATH includes all necessary binary locations
3. Run `hx --health` to verify language server installations
4. Check the Helix log file: `~/.cache/helix/helix.log`

## Updates

To update language servers, run the installation script again. It will update existing installations to their latest versions.

For Helix updates:
```bash
brew upgrade helix
```
