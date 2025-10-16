vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Set indentation width to 4 spaces
vim.opt.tabstop = 4 -- Set the width of a tab character to 4 spaces
vim.opt.softtabstop = 4 -- Makes backspacing work consistently with spaces

-- TODO: Comment this line if you're using wsl
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and system
vim.opt.number = true -- Show line numbers
vim.o.relativenumber = true -- Set relative numbered lines

vim.o.wrap = false -- Disable wrapping
vim.o.linebreak = true -- Break at word boundaries instead of cutting words
vim.o.autoindent = true -- Copy indent from current line when starting a new one

vim.o.ignorecase = true -- Case-insensitive searching UNLESS capital in search
vim.o.smartcase = true -- Smart case
vim.o.hlsearch = false -- Set highlight on search 

vim.o.foldmethod = "indent" -- Method of folding
vim.o.foldenable = true -- Alow folding in files
vim.o.foldlevel = 99 -- Everything starts unfolded

vim.opt.cursorline = true -- Show which line your cursor is on

vim.opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor.

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

vim.opt.iskeyword:remove("_") -- Remove underscore from word characters

-- vim.cobol plugin variables
vim.g.cobol_colorcolumns = 1
