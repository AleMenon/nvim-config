return {
   {
      -- Autoclose parentheses, brackets, quotes, etc.
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = true,
      opts = {},
   },

   {
      --Surround text with brackets, quotes, etc.
      'nvim-mini/mini.surround',
      event = 'BufEnter',
      version = false,
      opts = {
         custom_surroundings = {
            ['('] = { output = { left = '(', right = ')' } },
            ['['] = { output = { left = '[', right = ']' } },
            ['{'] = { output = { left = '{', right = '}' } },
            ['<'] = { output = { left = '<', right = '>' } },
         },
      }
   },
}
