-- Format on save and linters
return {
   'nvimtools/none-ls.nvim',
   dependencies = {
      'nvimtools/none-ls-extras.nvim',
      'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
   },
   config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting   -- to setup formatters
      local diagnostics = null_ls.builtins.diagnostics -- to setup linters

      -- list of formatters & linters for mason to install
      require('mason-null-ls').setup {
         ensure_installed = {
            'prettier', -- ts/js formatter
            'ruff',
         },
         -- auto-install configured formatters & linters (with null-ls)
         automatic_installation = true,
      }

      local sources = {
         formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
         require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
         require 'none-ls.formatting.ruff_format',
      }
   end,
}
