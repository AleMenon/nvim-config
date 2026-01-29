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
vim.keymap.set('n', '<leader>xv', '<C-w>H', opts) -- close current split window
vim.keymap.set('n', '<leader>xh', '<C-w>K', opts) -- close current split window

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
vim.keymap.set('n', '<S-Up>', ':resize -15<CR>', opts)
vim.keymap.set('n', '<S-Down>', ':resize +15<CR>', opts)
vim.keymap.set('n', '<S-Left>', ':vertical resize -15<CR>', opts)
vim.keymap.set('n', '<S-Right>', ':vertical resize +15<CR>', opts)

-- Clipboard shortcut for WSL
-- TODO: Uncomment this line if you're using wsl
-- vim.keymap.set('v', '<leader>y', ':w !clip.exe<CR><CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Keymap for my TODO plugin
vim.keymap.set('n', '<leader>td', ':Td<CR>', opts)

-- Keymap to format a json in a new buffer
vim.keymap.set('n', '<leader>fj', function ()

    -- Create a buffer
    local buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buf)

    -- Set filetype and name for the new buffer
    vim.bo.filetype = 'json'
    vim.api.nvim_buf_set_name(0, 'tmp_' .. os.date('%H%M%S_%d%m%Y') .. '.json')

    -- Paste yanked json
    vim.cmd('normal! p')

    -- Convert fields from python to json format
    vim.cmd("%s/'/\"/ge")
    vim.cmd("%s/False/false/ge")
    vim.cmd("%s/True/true/ge")
    vim.cmd("%s/None/null/ge")

    -- Copy of the json to clipboard after conversion
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local text = table.concat(lines, "\n")
    vim.fn.setreg('+', text)

    -- Format with jq
    vim.cmd('%!jq')

    -- Indent buffer
    vim.cmd('normal gg=G')
    vim.cmd('LspRestart jsonls')
end, opts)
