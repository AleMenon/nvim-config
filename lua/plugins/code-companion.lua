return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        adapters = {
            http = {
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {
                        env = {
                            -- TODO: Change this path if you're on Windows
                            api_key = "cmd:grep OPENAI_API_KEY ~/.config/nvim/.env | cut -d'=' -f2 | tr -d '\"'",
                            -- api_key = [[cmd:powershell -Command "(Get-Content $env:LOCALAPPDATA\nvim\.env | Select-String 'OPENAI_API_KEY').ToString().Split('=')[1].Trim().Trim('\"')"]],
                        },
                    })
                end,
            }
        },
        strategies = {
            chat = {
                adapter = {
                    name = "openai",
                    model = "gpt-4.1",
                }
            },
            inline = {
                adapter = {
                    name = "openai",
                    model = "gpt-4.1",
                }
            },
        }
    },
}
