<h1 align="center">My Neovim Setup</h1>

This repository contains my Neovim configuration, including plugins, keymaps, and options that I find useful.

![Catppuccin theme](./images/catppuccin-menu.png) 
![Gruvbox theme](./images/gruvbox-menu.png)

## Directory Structure

- **lua/** – Main Lua configuration:
    - **lua/core/** – Keymaps and core configuration files
    - **lua/plugins/** – Plugin configurations
    - **lua/todofloat/** – Custom floating TODO window plugin

## Installation

This setup is designed for Arch Linux. Some packages may not work on other distributions or operating systems (e.g., Windows).  
If you encounter issues, check the [Known Issues](#known-issues) section or contact me.

### Prerequisites

#### Python

Some Neovim plugins require Python. For Arch-based distros, install with:

```bash
sudo pacman -Syu
sudo pacman -S python python-pip
```

#### LaTeX

LaTeX highlighting requires extra packages. First, install Node.js and npm:

```bash
sudo pacman -Syu
sudo pacman -S nodejs npm
```

Then install tree-sitter-cli for LaTeX highlighting:

```bash
npm install -g tree-sitter-cli
```

### Setup Steps

1. Clone this repository and move all files to your Neovim configuration folder.
2. Remove the `.git`, `images` directories, and `README.md` file.
3. Optionally, remove `nvim-shortcuts.txt` if you don't need it.
4. Open Neovim; plugins will be installed automatically via Lazy.nvim.

#### Extra

If you encounter LSP installation errors, run `:MasonLog` in Neovim, follow the instructions, and install any missing packages.

## Known Issues

> **Windows 10:**  
> The TODO float plugin may not find the `todo.md` file on some PCs. The cause is unknown and seems to affect only certain setups.

## Final Notes

This configuration is tailored to my daily workflow, featuring essential plugins I find useful. Feel free to customize or add new plugins as you like.
