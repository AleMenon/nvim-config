require 'core' -- Global configurations
require 'plugins' -- Plugins configuration

local todo_float = require("todofloat") -- Own built TODO float plugin
todo_float.setup({
   target_file = "~/.config/nvim/lua/todofloat/todo.md"
})
