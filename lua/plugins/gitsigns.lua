-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
   'lewis6991/gitsigns.nvim',
   event = 'BufReadPre',
   opts = {
      signs = {
         add = { text = '+' },
         change = { text = '~' },
         delete = { text = '_' },
         topdelete = { text = '‾' },
         changedelete = { text = '~' },
      },
      signs_staged = {
         add = { text = '+' },
         change = { text = '~' },
         delete = { text = '_' },
         topdelete = { text = '‾' },
         changedelete = { text = '~' },
      },
      current_line_blame_opts = {
          delay = 0,
      },
      vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>', { desc = "[G]it [B]lame", noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>gl', ':Gitsigns toggle_current_line_blame<CR>', { desc = "[G]it blame [L]ine", noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<CR>', { desc = "[G]it [N]ext hunk", noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>gp', ':Gitsigns prev_hunk<CR>', { desc = "[G]it [P]revious hunk", noremap = true, silent = true }),
      vim.keymap.set({'n', 'v'}, '<leader>gh', ':Gitsigns stage_hunk<CR>', { desc = "[G]it Stage [H]unk", noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_buffer<CR>', { desc = "[G]it [S]tage Buffer", noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', { desc = "[G]it [U]ndo Stage Hunk", noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = "[G]it [D]iffthis", noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>gk', ':Gitsigns preview_hunk_inline<CR>', { desc = "[G]it Preview Hun[k] Inline", noremap = true, silent = true }),
      vim.keymap.set({'n', 'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = "[G]it [R]eset Hunk", noremap = true, silent = true }),
   },
}
