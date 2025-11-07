return {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
        parser = { 
            comments = { "#", "//" },
            delimiter = {
                ft = {
                    csv = {";", ","},        -- Always use comma for .csv files
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
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
