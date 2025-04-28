vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 3 -- Set indentation width to 3 spaces
vim.opt.tabstop = 3 -- Set the width of a tab character to 3 spaces
vim.opt.softtabstop = 3 -- Makes backspacing work consistently with spaces

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

