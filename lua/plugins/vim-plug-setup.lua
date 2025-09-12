return { -- Vim Plug configuration
   vim.cmd [[
      call plug#begin('~/.local/share/nvim/plugged')

      Plug 'Jorenar/COBOL.vim'
      Plug 'nvim-pack/nvim-spectre'
      Plug 'mechatroner/rainbow_csv'

      call plug#end()
   ]]
}
