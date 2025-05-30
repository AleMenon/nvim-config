return { 
   -- Catppuccin colorscheme
   {
      "catppuccin/nvim", 
      name = "catppuccin", 
      priority = 1001,
      opts = {
         no_italic = true,
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
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
         }
      }
   },
}
