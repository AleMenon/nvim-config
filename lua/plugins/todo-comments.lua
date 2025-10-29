return {
   "folke/todo-comments.nvim",
   event = 'VeryLazy',
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      vim.keymap.set("n", "]t", function()
         require("todo-comments").jump_next()
      end, { desc = "Next todo comment" }),

      vim.keymap.set("n", "[t", function()
         require("todo-comments").jump_prev()
      end, { desc = "Previous todo comment" }),

      vim.keymap.set('n', '<leader>tt', ':TodoTelescope<CR>', { noremap = true, silent = true }),
   }
}
-- TODO:
-- HACK:
-- WARN:
-- FIX:
-- PERF:
-- NOTE:
-- TEST:
