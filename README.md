# Neovim Config

Minimal Lua-based Neovim setup with theme switching, Telescope integration, and LSP support.
## Screenshots

![](https://github.com/DmitriyYurck/My-Config/blob/main/Screenshot_2025-08-15-14-46-29-471.jpg)
![](https://github.com/DmitriyYurck/My-Config/blob/main/Screenshot_2025-08-15-15-06-27-545.jpg)
![](https://github.com/DmitriyYurck/My-Config/blob/main/Screenshot_2025-08-15-14-48-18-176.jpg)
## Features

- File explorer (`NvimTree`)
- Fuzzy finder (`Telescope`)
- Undo history (`Undotree`)
- Theme toggle (`poimandres` / `everforest`)
- LSP for Lua, Rust, TypeScript
- Autocompletion (`nvim-cmp`)
- Treesitter syntax highlighting
- Statusline (`lualine`)
- Keymap helper (`WhichKey`)
- Autopairs

## Keybindings

| Mode   | Key         | Action                    |
|--------|-------------|---------------------------|
| Insert | `jj`        | Exit to Normal mode       |
| Normal | `ww`        | Save                      |
| Normal | `qq`        | Quit                      |
| Normal | `<leader>e` | Toggle file tree          |
| Normal | `<leader>f` | Find files (Telescope)    |
| Normal | `<leader>r` | Live grep (Telescope)     |
| Normal | `<leader>u` | Toggle undo tree          |
| Normal | `<leader>k` | Show keymap hints         |
| Normal | `<leader>tt`| Toggle theme              |
| Normal | `<leader>s` | Search in current file    |

## Requirements

- Neovim 0.9+
- `ripgrep` for live grep
- `rust-analyzer` for Rust LSP
- `node` for TypeScript LSP

## Installation

Clone into your config directory:

```bash
git clone https://github.com/DmitriyYurck/My-Config.git
