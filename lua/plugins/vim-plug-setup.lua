return { -- Vim Plug configuration
   vim.cmd [[
      call plug#begin('~/.local/share/nvim/plugged')

      Plug 'Jorenar/COBOL.vim', { 'for': 'cobol' }

      call plug#end()
   ]]
}
