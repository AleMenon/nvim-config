return { 
   -- Catppuccin colorscheme
   {
      "catppuccin/nvim", 
      name = "catppuccin", 
      lazy = false,
      priority = 1001,
      opts = {
         styles = {
            comments = {},
         },
      }
   },

   -- Gruvbox colorscheme
   { 
      "ellisonleao/gruvbox.nvim", 
      priority = 1000 , 
      lazy = false,
      config = true,
      opts = {
         italic = {
            comments = false,
         }
      }
   },

   -- Tokyonight colorscheme
   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
  },

  -- Nightingale colorscheme
  {
      "xeind/nightingale.nvim",
      lazy = false,
      priority = 1000,
      config = function()
          require("nightingale").setup({
              transparent = false,
          })
          vim.cmd("colorscheme nightingale")
      end,
  }
}
