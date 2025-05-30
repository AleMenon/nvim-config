return function()
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
      require 'plugins.colorschemes', -- Colorscheme plugins
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
      require 'plugins.pairs-and-surrounds', -- Autopair and surround plugins
      require 'plugins.oil', -- File creation and management
      require 'plugins.none-ls', -- Autoformatting for python
      require 'plugins.which-key', -- Useful for finding keymaps you don't remember
      require 'plugins.flash', -- Teleportation in the code
      require 'plugins.todo-comments', -- Better comments
   })
end
