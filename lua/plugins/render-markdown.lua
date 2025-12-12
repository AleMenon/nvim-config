return {
   'MeanderingProgrammer/render-markdown.nvim',
   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
   ---@module 'render-markdown'
   ---@type render.md.UserConfig
   ft = { 'markdown', 'md' },
   opts = {},
   vim.keymap.set('n', '<leader>mk', ':RenderMarkdown toggle<CR>', { noremap = true, silent = true }) -- toggle markdown
}
