return {
   require ('plugins.lazy-setup')(),
   require 'plugins.plug-setup',
   vim.cmd.colorscheme "catppuccin" -- Colorscheme setup
}
