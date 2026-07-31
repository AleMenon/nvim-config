return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            progress = {
                enabled = false,
            },
            hover = {
                enabled = false,
            },
            signature = {
                enabled = false,
            },
            message = {
                enabled = false,
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                timeout = 3000
            }
        }
    }
}
