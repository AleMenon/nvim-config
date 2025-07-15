require 'core' -- Global configurations
require 'plugins' -- Plugins configuration

-- Own built TODO float plugin
require("todofloat").setup({
   target_file = "~/.config/nvim/lua/todofloat/todo.md"
})
