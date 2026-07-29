return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            progress = {
                enabled = false,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
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
