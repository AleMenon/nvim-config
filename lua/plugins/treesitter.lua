return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',

    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    config = function()
        local ensure_installed = {
            'bash',
            'c',
            'diff',
            'html',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'query',
            'vim',
            'vimdoc',
            'latex',
            'python',
            'sql',
            'powershell',
            'toml',
            'robot'
        }

        require('nvim-treesitter').install(ensure_installed)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = ensure_installed,
            callback = function() vim.treesitter.start() end,
        })
    end,
}
