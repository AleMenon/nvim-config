-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>xb', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Clipboard shortcut for WSL
-- vim.keymap.set('v', '<leader>y', ':w !clip.exe<CR><CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==gv', opts)
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==gv', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- New line up and down
vim.keymap.set('n', '<leader>o', 'o<Esc>', opts)
vim.keymap.set('n', '<leader>O', 'O<Esc>', opts)

-- Keymap for my TODO plugin
vim.keymap.set('n', '<leader>td', ':Td<CR>', opts)

-- Keymaps to change relative number column
vim.keymap.set({'n', 'v'}, '<leader>ar', ':set relativenumber<CR>', opts)
vim.keymap.set({'n', 'v'}, '<leader>dr', ':set norelativenumber<CR>', opts)

-- Keymap to format a json file
vim.keymap.set('n', '<leader>fj', ':%!jq<CR>', opts)

-- Keymaps from spectre
-- NOTE: They are here because I couldn't find a better place to set them
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
   desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sc', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
   desc = "Search current word"
})
vim.keymap.set('v', '<leader>sc', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
   desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
   desc = "Search on current file"
})
