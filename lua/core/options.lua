vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Set indentation width to 4 spaces
vim.opt.tabstop = 4 -- Set the width of a tab character to 4 spaces
vim.opt.softtabstop = 4 -- Makes backspacing work consistently with spaces

-- TODO: Comment this line if you're using wsl
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and system
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Set relative numbered lines

vim.opt.wrap = false -- Disable wrapping
vim.opt.linebreak = true -- Break at word boundaries instead of cutting words
vim.opt.autoindent = true -- Copy indent from current line when starting a new one

vim.opt.ignorecase = true -- Case-insensitive searching UNLESS capital in search
vim.opt.smartcase = true -- Smart case
vim.opt.hlsearch = false -- Set highlight on search

vim.opt.foldmethod = "indent" -- Method of folding
vim.opt.foldenable = true -- Alow folding in files
vim.opt.foldlevel = 99 -- Everything starts unfolded

vim.opt.cursorline = true -- Show which line your cursor is on

vim.opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor.

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Session options, these are the default ones, add more if needed
vim.opt.sessionoptions = {
    'buffers',
    'curdir',
    'folds',
    'help',
    'tabpages',
    'winsize',
    'terminal',
}
