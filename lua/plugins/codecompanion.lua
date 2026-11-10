return {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "MeanderingProgrammer/render-markdown.nvim",
        "HakonHarnes/img-clip.nvim",
    },
    opts = {
        adapters = {
            acp = {
                codex = function()
                    return require("codecompanion.adapters").extend("codex", {
                        defaults = {
                            auth_method = "chat-gpt",
                        },
                    })
                end,
            },
        },
        interactions = {
            chat = {
                adapter = "codex",
            },
            inline = {
                adapter = "codex"
            }
        },
    },
}
