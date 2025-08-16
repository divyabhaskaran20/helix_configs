#!/usr/bin/env bash
# install-lsp.sh - Quiet installation with summary

# -u → treat unset variables as errors
#-o pipefail → fail on errors in pipelines
set -uo pipefail

echo "Installing LSPs and formatters..."

# Function returns true if command exists, False on failure
command_exists() { command -v "$1" >/dev/null 2>&1; }

# Arrays to track status
INSTALLED=()
ALREADY=()
FAILED=()

# ANSI color codes
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NC="\033[0m"  

# ---------- Helper function ----------
try_install() {
    local name="$1"
    local cmd="$2"

    if command_exists "$name"; then
        ALREADY+=("$name")
        return
    fi

    # Run the install command quietly
    if eval "$cmd" >/dev/null 2>&1; then
        INSTALLED+=("$name")
    else
        FAILED+=("$name")
    fi
}

# ---------- C / C++ ----------
try_install "clangd" "sudo apt update && sudo apt install -y clangd"
try_install "clang-format" "sudo apt install -y clang-format"

# ---------- Go ----------
try_install "gopls" "go install golang.org/x/tools/gopls@latest"
try_install "gofmt" "command -v go >/dev/null" # gofmt comes with Go

# ---------- Rust ----------
try_install "rust-analyzer" "sudo apt install -y rust-analyzer"
try_install "rustfmt" "rustup component add rustfmt"

# ---------- Python ----------
try_install "pylsp" " pip install python-lsp-server python-lsp-black python-lsp-isort pylsp-mypy rope pylsp-rope"


# ---------- Summary ----------
echo ""
echo "================= LSP Installation Summary ================="
echo -e "${GREEN}Already installed: ${ALREADY[*]:-None}"
echo -e "${GREEN}Successfully installed: ${INSTALLED[*]:-None}"
echo -e "${YELLOW}Failed to install: ${FAILED[*]:-None}"
echo -e "${NC}============================================================="
