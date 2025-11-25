return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    branch = "stable",  -- Use stable branch for production
    lazy = false, -- Necessary for `default_explorer` to work properly
    opts = {
        views = {
            finder = {
                win = {
                    kinds = {
                        split_left_most = {
                            width = "26%",
                            win_opts = {
                                winfixwidth = true,
                            },
                        },
                    },
                },
                mappings = {
                    ["q"] = "CloseView",
                    ["<CR>"] = "Select",
                    ["<C-t>"] = "SelectTab",
                    ["|"] = "SelectVSplit",
                    ["-"] = "SelectSplit",
                    ["^"] = "GotoParent",
                    ["="] = "GotoCwd",
                    ["."] = "GotoNode",
                    ["#"] = "CollapseAll",
                    ["<BS>"] = "CollapseNode",
                },
            },
        },
    },

    vim.keymap.set('n', '<leader>e', function ()
        require('fyler').open({kind = 'split_left_most'})
    end, {desc='Open Fyler in the left side'}),

    vim.keymap.set("n", "<space>-", function ()
        require('fyler').open({kind = 'float'})
    end, {desc='Open Fyler in float window'}),
}
