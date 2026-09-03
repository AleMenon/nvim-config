return {
    {
        -- Autoclose parentheses, brackets, quotes, etc.
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {},
    },

    {
        -- Surround text with brackets, quotes, etc.
        'nvim-mini/mini.surround',
        event = 'VeryLazy',
        version = false,
        opts = {
            custom_surroundings = {
                ['('] = { output = { left = '(', right = ')' } },
                ['['] = { output = { left = '[', right = ']' } },
                ['{'] = { output = { left = '{', right = '}' } },
                ['<'] = { output = { left = '<', right = '>' } },
            },
        }
    },
    {
        -- Log highlight for better visualization
        'fei6409/log-highlight.nvim',
        ft = 'log',
        event = 'BufReadPre',
        opts = {
            keyword = {
                error = { 'ERROR', 'FAIL' },
                warning = { 'WARN', 'WARNING' },
                info = { 'INFO' },
                debug = { 'DEBUG' },
                trace = { 'TRACE' },
            },
        }
    },
    {
        -- Function context
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        config = function()
            require("treesitter-context").setup({
                max_lines = 2,
                multiline_threshold = 1,
                trim_scope = "inner",
            })
        end
    },
    {
        -- Being used by Scooter
        'akinsho/toggleterm.nvim',
        event = 'VeryLazy',
        version = "*",
        opts = {--[[ things you want to change go here]]}
    },
    {
        "azratul/live-share.nvim",
        config = function()
            require("live-share").setup({
                username = "AleMenon",
            })
        end,
    }
}
