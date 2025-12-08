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
}
