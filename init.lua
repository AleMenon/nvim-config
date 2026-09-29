vim.loader.enable()
require 'core' -- Global configurations
require 'plugins' -- Plugins configuration

-- Custom-built TODO float plugin
-- Accepts target_file as an argument to configure which file to open.
-- If not set, it defaults to CONFIG_DIR/lua/todofloat/todo.md.
require("todofloat").setup()
