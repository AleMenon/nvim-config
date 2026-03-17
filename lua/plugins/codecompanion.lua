return {
    "olimorris/codecompanion.nvim",
    version = "*",
    opts = {
        interactions = {
            chat = {
                adapter = 'gemini',
            },
            inline = {
                adapter = 'gemini',
            },
            cmd = {
                adapter = 'gemini',
            },
        },
        adapters = {
            http = {
                gemini = function()
                    return require('codecompanion.adapters').extend('gemini', {
                        env = {
                            api_key = "cmd:rg GEMINI_API_KEY ~/.config/nvim/.env | cut -d'=' -f2 | tr -d '\"'",
                        },
                        schema = {
                            model = {
                                default = 'gemini-2.5-flash',
                            },
                        },
                    })
                end,
            }
        }
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
}
