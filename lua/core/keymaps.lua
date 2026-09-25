local function opts(overrides)
    vim.tbl_extend('force', { silent=true }, overrides or {})
end

--- @param tp string Define the filetype.
--- @param cmd string Define what command will be used to format the file.
--- @return nil
local function formatter(tp, cmd)
    -- Create a buffer
    local buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buf)

    -- Set filetype and name for the new buffer
    vim.bo.filetype = tp
    vim.api.nvim_buf_set_name(0, 'tmp_' .. os.date('%H%M%S_%d%m%Y') .. '.' .. tp)

    -- Paste yanked string
    vim.cmd('normal! p')

    if tp == 'json' then
        -- Convert fields from python to json format
        vim.cmd([[%s/"[^"]*"\|'/\=submatch(0) == "'" ? '"' : submatch(0)/ge]])
        vim.cmd("%s/False/false/ge")
        vim.cmd("%s/True/true/ge")
        vim.cmd("%s/None/null/ge")
    elseif tp == 'xml' then
        vim.cmd("%s/^\\n\\+//e")
    end

    -- Copy of the string to clipboard after conversion (in case of error with the formatter)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local text = table.concat(lines, "\n")
    vim.fn.setreg('+', text)

    -- Format with the command defined in cmd parameter
    vim.cmd('%!' .. cmd)

    if tp == 'json' then
        -- Indent buffer
        vim.cmd('normal gg=G')
    elseif tp == 'xml' then
        vim.cmd('%s/^\\(\\s*\\)/\\1\\1/')
    end
end

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', opts({ remap = true }))

-- Disable the F1 help keymap
vim.keymap.set({ 'n', 'v', 'i' }, '<F1>', '<Nop>', opts({ remap = true }))

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts())

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts())
vim.keymap.set('n', 'N', 'Nzzzv', opts())

vim.api.nvim_create_user_command('Explorer', 'silent !explorer .', { desc = 'Open Windows Explorer in current directory' })

vim.keymap.set('n', '<leader>v', '<C-w>v', opts({ desc = 'Split window [V]ertically' }))
vim.keymap.set('n', '<leader>h', '<C-w>s', opts({ desc = 'Split window [H]orizontally'}))
vim.keymap.set('n', '<leader>se', '<C-w>=', opts({ desc = 'Make [S]plit windows [E]qual width & height' }))
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts({ desc = 'Close[X] current [S]plit window' }))

vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts({ desc = 'Change focus to the split above[K]' }))
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts({ desc = 'Change focus to the split below[J]' }))
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts({ desc = 'Change focus to the left[H] split' }))
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts({ desc = 'Change focus to the right[L] split' }))

vim.keymap.set('n', '<S-Up>', ':resize -15<CR>', opts({ desc = 'Resize split [Up]' }))
vim.keymap.set('n', '<S-Down>', ':resize +15<CR>', opts({ desc = 'Resize split [Down]' }))
vim.keymap.set('n', '<S-Left>', ':vertical resize -15<CR>', opts({ desc = 'Resize split [Left]' }))
vim.keymap.set('n', '<S-Right>', ':vertical resize +15<CR>', opts({ desc = 'Resize split [Right]' }))

-- TODO: Uncomment this line if you're using wsl
-- vim.keymap.set('v', '<leader>y', ':w !clip.exe<CR><CR>', opts({ desc = 'WSL clipboard configuration'}))

vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts({ desc = 'Toggle [L]ine [W]rapping' }))

vim.keymap.set('v', '<', '<gv', opts({ desc = 'Indent selected text left[<]' }))
vim.keymap.set('v', '>', '>gv', opts({ desc = 'Indent selected text right[>]' }))

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts({ desc = 'Move selected text down[J]' }))
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts({ desc = 'Move selected text up[K]' }))

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts({ desc = 'Scroll half-page [D]own' }))
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts({ desc = 'Scroll half-page [U]p' }))
vim.keymap.set('n', '<C-f>', '<C-f>zz', opts({ desc = 'Scroll full page down[F]' }))
vim.keymap.set('n', '<C-b>', '<C-b>zz', opts({ desc = 'Scroll full page up[B]' }))
vim.keymap.set('n', '<C-e>', '<C-d>zz', opts({ desc = 'Scroll one line down[E]' }))
vim.keymap.set('n', '<C-y>', '<C-u>zz', opts({ desc = 'Scroll one line up[Y]' }))

vim.keymap.set('n', '<leader>td', ':Td<CR>', opts({ desc = 'Open [T]O[D]O plugin pop-up' }))

vim.keymap.set('n', '<leader>fj', function ()
    formatter('json', 'jq')
end, opts({ desc = '[F]ormat [J]son from clipboard' }))

-- Keymap to format a xml in a new buffer
vim.keymap.set('n', '<leader>fx', function ()
    formatter('xml', 'xmllint --format -')
end, opts({ desc = '[F]ormat [X]ML from clipboard' }))

vim.keymap.set('n', '<leader>cl', function ()
    vim.cmd('%s/^\\(.\\{-}\\[[A-Z]\\+\\]\\)\\(\\s\\+\\[.\\{-}\\]\\)\\+\\s\\+/\\1 /') end, opts({ desc = '[C]lean unecessary [L]og information from .log files'}))
vim.keymap.set('n', '<leader>\\', ':terminal pwsh.exe<CR>i', opts({ desc = 'Open terminal[\\]'}))
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', opts({ desc = 'Exit terminal[\\] mode'}))

vim.keymap.set('n', '<leader>dv', function ()
    if vim.wo.diff then
        vim.cmd('windo diffoff')
    else
        vim.cmd('windo diffthis')
    end
end, opts({ desc = 'Toggle [D]iff [V]iew'}))

vim.keymap.set('v', '<leader>p', '"_dP', opts({ desc = '[P]aste discarding content' }))
