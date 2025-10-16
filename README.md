<h1 align="center">My Neovim Setup</h1>

This repository contains my Neovim configuration, including plugins, keymaps, and options that I find useful.

![Catppuccin menu](./images/catppuccin-menu.png) 
![Syntax highlight](./images/syntax-highlight-and-neotree.png) 

## Directory Structure

- **lua/** – Main Lua configuration:
    - **lua/core/** – Keymaps and core configuration files
    - **lua/plugins/** – Plugin configurations
    - **lua/todofloat/** – Custom floating TODO window plugin

## Installation

This setup is primarily designed for Arch Linux, but it can also work on Windows with a few adjustments. See the [Extra](#extra) section for details.
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

#### OpenAI API key

It's necessary to have a `.env` file in your neovim directory with `OPENAI_API_KEY = "YOUR_API_KEY"` property, this is needed for CodeCompanion plugin to work.
Also, if you're on Windows, it's recommended to use powershell as your terminal, since the command to get the API key in the file is based on powershell.

### Setup Steps

1. Clone this repository and move all files to your Neovim configuration folder;
2. Feel free to remove the `.git` and `images` directories, `README.md` and `.gitignore` files if you want;
3. Open Neovim, plugins will be installed automatically via Lazy.nvim;
4. Run `:PlugInstall` to install the plugins that uses Vim Plug as the installer.

#### Extra

1. If you encounter LSP installation errors, run `:MasonLog` in Neovim, follow the instructions, and install any missing packages.
2. Windows settings:
    - For todofloat plugin to work, change the path being passed as parameter in the `init.lua` file.
    - Icons being used in the GitGraph plugin aren't working on Windows, so simply comment the `symbols = {...}` section to use the default ones.
    - For CodeCompanion to work, change the path inside the configuration, for it to find your `.env` file.
    - Files with things that need changing depending on the system you're in have a *TODO* comment right above them with instructions.

## Known Issues

> [!NOTE]
> There's no known issue until this moment

## Final Notes

This configuration is tailored to my daily workflow, featuring essential plugins I find useful. Feel free to customize as you like.
