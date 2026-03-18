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
                            -- TODO: Change key and path if you're on Windows or with another API key inside .env
                            -- api_key = "cmd:rg <key> <path> | cut -d'=' -f2 | tr -d '\"'",
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
