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
      'echasnovski/mini.surround',
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
