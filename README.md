# Helix Config

Personal configuration for the [Helix editor](https://helix-editor.com/), optimized for C, Rust, Go, and Python development with language servers, formatting, and custom key mappings.

---

## Features

- **Themes & UI**
  - Everforest Light theme
  - Relative line numbers
  - Custom cursor shapes
  - Auto-completion and auto-save
  - Smart keybindings
- **Language Support**
  - C (`clangd` + `clang-format`)
  - Rust (`rust-analyzer` + `rustfmt`)
  - Go (`gopls` + `gofmt`)
  - Python (`pylsp` + `black`, optional plugins)
- **Flexible Configuration**
  - Separate `config.toml` for editor settings
  - Separate `languages.toml` for language-specific LSPs and formatters

---

## Installation

Clone the repository:

```bash
git clone https://github.com/divyabhaskaran20/helix-config.git
mkdir -p ~/.config/helix
ln -s ~/path/to/helix-config/config.toml ~/.config/helix/config.toml
ln -s ~/path/to/helix-config/languages.toml ~/.config/helix/languages.toml
```

---

## LSP Setup

To enable full language support, install the required language servers:

```bash
# C
sudo apt install clang-format clangd

# Rust
rustup component add rust-analyzer rustfmt

# Go
go install golang.org/x/tools/gopls@latest

# Python
pip install --user python-lsp-server python-lsp-black python-lsp-isort pylsp-mypy rope python-lsp-rope
```

> Make sure `~/.local/bin` is in your `PATH` to run Python LSP binaries.  
> Optional: Use `setup-lsp.sh` to automate installation of all supported language servers and plugins.

---

## Directory Structure

```
helix-config/
├── README.md           # This file
├── config.toml         # Editor UI, keymaps, auto-save, etc.
├── languages.toml      # Per-language setup (LSP + formatter)
├── setup-lsp.sh        # Optional script to install language servers
├── LICENSE             # MIT license file
```

---

## Contributing

Contributions, bug reports, and suggestions are welcome!

1. Fork the repository  
2. Create a feature branch: `git checkout -b feature-name`  
3. Commit your changes: `git commit -m "Add feature"`  
4. Push to the branch: `git push origin feature-name`  
5. Open a Pull Request  

---

## License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.
