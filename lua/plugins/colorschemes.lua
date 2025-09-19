return { 
   -- Catppuccin colorscheme
   {
      "catppuccin/nvim", 
      name = "catppuccin", 
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
  }
}
