return {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    config = function() 
        vim.keymap.set('n', '<leader>gm', ':Gvdiffsplit!<CR>', { desc = "[G]it [M]ergetool", noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fg', ':tab G<CR>', { desc = "[F]u[G]itive", noremap = true, silent = true })
    end,

    -- NOTE: Some useful commands:
    -- :G checkout -b <branch>
    -- :Gvdiffsplit
    -- :Gvdiffsplit <branch>
    -- :G log
    --     <S-o> to see the difference of the commit your cursor is on
    -- :Gvdiffsplit!
    --     Merge conflict tool - Open 3 windows, left - Your changes, right - The branch you're merging in, middle - The merge conflict
    --     d2o - Accept your changes
    --     d3o - Accept the changes from the other branch
}
