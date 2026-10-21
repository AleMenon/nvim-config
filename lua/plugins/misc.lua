-- Plugins with less than 1kb config size
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
        "azratul/live-share.nvim",
        config = function()
            require("live-share").setup({
                username = "AleMenon",
            })
        end,
    },
    {
        -- Teleportation in the code
        "folke/flash.nvim",
        event = 'VeryLazy',
        opts = {},
        keys = {
            { "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
    },
    {
        -- Run git commands inside neovim
        'tpope/vim-fugitive',
        event = 'VeryLazy',
        config = function()
            vim.keymap.set('n', '<leader>gm', ':Gvdiffsplit!<CR>', { desc = "[G]it [M]ergetool", silent = true })
            vim.keymap.set('n', '<leader>fg', ':tab G<CR>', { desc = "[F]u[G]itive", silent = true })
        end,
    },
    {
        -- Functions line
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
        main = 'ibl',
        opts = {
            indent = {
                char = '▏',
            },
            scope = {
                show_start = false,
                show_end = false,
                show_exact_scope = false,
            },
            exclude = {
                filetypes = {
                    'help',
                    'startify',
                    'dashboard',
                    'packer',
                    'neogitstatus',
                    'NvimTree',
                    'Trouble',
                },
            },
        },
    },
    {
        -- Web markdown preview
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown", 'md' },

        vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<CR>' , { desc = '[M]arkdown [P]review', silent = true })
    },
    {
        -- Code snapshot plugin
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        main = "nvim-silicon",
        opts = {
            debug = false,
            to_clipboard = true,

            theme = "Dracula",
            font = "RobotoMono Nerd Font",

            background = "#1a1b26",
            shadow_color = "#1a1b26",
            pad_horiz = 80,
            pad_vert = 60,

            line_offset = function(args)
                return args.line1
            end,
        },

        vim.keymap.set({'n', 'v'}, '<leader>cs', function ()
            require("nvim-silicon").clip()
        end, { desc = "[C]ode [S]napshot"}),
    },
    {
        -- Better comments
        "folke/todo-comments.nvim",
        event = 'VeryLazy',
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            vim.keymap.set('n', '<leader>tt', ':TodoTelescope<CR>', { silent = true, desc = '[T]odo[T]elescope'}),
        }
        -- TODO:
        -- HACK:
        -- WARN:
        -- FIX:
        -- PERF:
        -- NOTE:
        -- TEST:
    },
    {
        -- Useful for finding keymaps you don't remember
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 1000,
        },
    }
}

