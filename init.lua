vim.loader.enable()
require 'core' -- Global configurations
require 'plugins' -- Plugins configuration

-- Own built TODO float plugin
require("todofloat").setup({
   -- TODO: Change this path if you're on Windows
   target_file = "~/.config/nvim/lua/todofloat/todo.md"
   -- target_file = "~/AppData/Local/nvim/lua/todofloat/todo.md"
})
