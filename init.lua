require 'core.options' -- Some text options
require 'core.keymaps' -- General keybind

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
   local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
   if vim.v.shell_error ~= 0 then
      error('Error cloning lazy.nvim:\n' .. out)
   end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
   require 'plugins.neotree', -- Files tree
   require 'plugins.colortheme', -- Colortheme
   require 'plugins.bufferline', -- Buffer manager
   require 'plugins.lualine', -- Lualine
   require 'plugins.treesitter', -- Highlighting
   require 'plugins.telescope', -- fzf files explorer
   require 'plugins.lsp', -- lsp configuration
   require 'plugins.autocompletion', -- Text suggestions and autocompletion
   require 'plugins.gitsigns', -- Git plugin
   require 'plugins.alpha', -- Welcome mensage and recent files
   require 'plugins.indent-blankline', -- Functions line
   require 'plugins.render-markdown', -- Markdown render
   require 'plugins.misc', -- Some other small plugins
   require 'plugins.oil-nvim' --File creation and management
})

-- Load vim-plug for exclusive plugins
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'morhetz/gruvbox'

  call plug#end()
]])

vim.cmd.colorscheme "gruvbox" -- Colorscheme setup

require('mini.surround').setup({ -- Mini.surround setup
   custom_surroundings = {
      ['('] = { output = { left = '(', right = ')' } },
      ['['] = { output = { left = '[', right = ']' } },
      ['{'] = { output = { left = '{', right = '}' } },
      ['<'] = { output = { left = '<', right = '>' } },
   },
})

require("oil").setup({ -- Oil.nvim setup
   keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-h>"] = false,
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
   },
   view_options = {
      show_hidden = true,
   },

   -- Open parent directory in current window
   vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),

   -- Open parent directory in float window
   vim.keymap.set("n", "<space>-", function ()
      require("oil").toggle_float()
   end, {desc="Float window"})
})
