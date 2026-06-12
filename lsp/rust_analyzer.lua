---@type vim.lsp.Config
return {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
            },
            check = {
                command = "clippy",
                extraArgs = {
                    "--",
                    "-W", "clippy::all",
                },
            },
            cargo = {
                allTargets = true,
                buildScripts = {
                    enable = true
                },
            },
            completion = {
                autoimport = {
                    enable = true
                },
                postfix = {
                    enable = true
                },
            },

            -- Semantic tokens
            semanticHighlighting = {
                punctuation = {
                    enable = true
                },
            },
        },
    }
}
