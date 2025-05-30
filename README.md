<h1 align=center>My Neovim Setup</h1>
This repository contains my Neovim setup, with all the plugins, keymaps and options that I found useful.

![Catppuccin theme](./images/catppuccin-menu.png) 

![Gruvbox theme](./images/gruvbox-menu.png)

## Directory Content

- **nvim-shortcuts.txt** - This file contains the basic commands from Neovim, and also the custom keymaps that are written in the lua/core/keymaps.lua file;
- **init.lua** - Default init file for Neovim configuration, **essential** for the configuration to work;
- **lua/** - Directory for the lua configuration:
    - **lua/core** - Keymaps and some other configuration files;
    - **lua/plugins** - All the installed plugins in their respective files;
    - **lua/todofloat** - Custom plugin, todo floating window.

## Installation

If you'd like to try this configuration, follow the steps below.
Also, if you encounter issues during installation, check the [Known issues](#known-issues) section or feel free to contact me.

### Prerequisites

- Python:
1. Some Neovim plugins require **Python** to work. The commands below install the necessary Python packages for Debian and Ubuntu-based distributions:

```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

- LaTeX:
1. Latex lsp and highlighting need some extra packages to work. First, install *Nodejs* and *npm* in your machine. The commands below are for linux distros based on **Debian and Ubuntu**:

```bash
sudo apt update
sudo apt install nodejs npm
```

2. After installing everything, run the command:

```bash
npm install -g tree-sitter-cli
```

### Cloning and Configuring Neovim

After making sure everything is ready, follow the steps:
1. Clone the repository and then move all the files to the Neovim configuration folder;
2. Remove the .git and images directories and README.md file;
3. Remove the nvim-shortcuts.txt file (optional, if you don't find it useful);
4. Open Neovim and everything will be installed with Lazy.nvim.

## Known Issues

>[!WARNING]
>For some reason, this configuration doesn't work with C files on Windows (atleast in my PC).
> The problem is that for some reason the lsp doesn't recognize functions from the standard libraries, like `printf()` , and also macros like `NULL`.
>If you find a solution, feel free to make a pull request or contact me on [LinkedIn](https://www.linkedin.com/in/alexandre-menon/).

## Final Considerations

This configuration was created to meet my daily needs, with all the essential plugins that I found useful. Feel free to change anything that you dislike or add new plugins.
