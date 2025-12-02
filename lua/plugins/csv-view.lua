return {
    "hat0uma/csvview.nvim",
    opts = {
        parser = {
            comments = { "#", "//" },
            delimiter = {
                ft = {
                    csv = ";",        -- Always use comma for .csv files
                    tsv = "\t",       -- Always use tab for .tsv files
                },
                fallbacks = {       -- Try these delimiters in order for other files
                    ",",              -- Comma (most common)
                    "\t",             -- Tab
                    ";",              -- Semicolon
                    "|",              -- Pipe
                    ":",              -- Colon
                    " ",              -- Space
                },
            },
        },
        keymaps = {
            -- Horizontal navigation
            jump_next_field_end = { "<C-l>", mode = { "n", "v" } },
            jump_prev_field_end = { "<C-h>", mode = { "n", "v" } },
        },
        view = {
            display_mode = 'border'
        },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },

    vim.keymap.set(
        'n',
        '<leader>tc',
        ':CsvViewToggle<CR>',
        {noremap = true, silent = true, desc = 'Toggle CsvView'}
    )
}
