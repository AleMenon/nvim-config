return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = { 'markdown', 'md', 'codecompanion' },
    opts = {
        checkbox = {
            custom = {
                paused = { raw = '[||]', rendered = '❚❚', highlight = 'RenderMarkdownUnchecked', scope_highlight = nil }
            }
        }
    },
    vim.keymap.set('n', '<leader>mk', ':RenderMarkdown toggle<CR>', { silent = true, desc = 'Toggle Render[M]ar[K]down' })
}
