--[[
-- init.lua
--
-- This file is the implementation of the floating TODO list plugin.
--]]

--[[
-- Table that will contain the plugin configuration
--]]
local M = {}

--[[
-- Function to get the expanded path from the home directory.
--
--Returns:
--    path: Complete path to the file we're trying to open.
--]]
local function expand_path(path)
   if path:sub(1, 1) == "~" then
      local home = os.getenv("HOME") or os.getenv("USERPROFILE")
      if not home then
         error("Could not determine home directory")
      end
      return home .. path:sub(2)
   end

   return path
end

--[[
-- Function the find the center of the screen.
-- 
-- Returns:
--    coordinates: The number equivalent to the center of the screen
--]]
local function center(outer, inner)
   return (outer - inner) / 2
end

--[[
-- Function to set the configurations of the buffer we're trying to open.
--
-- Returns:
--    table: Table with the settings for the buffer.
--]]
local function win_config()
   local width = math.min(math.floor(vim.o.columns * 0.8), 128)
   local height = math.floor(vim.o.lines * 0.8)

   return {
      relative = "editor",
      width = width,
      height = height,
      col = center(vim.o.columns, width),
      row = center(vim.o.lines, height),
      border = "single"
   }

end

--[[
-- Function to create, open and set keymaps for the TODO buffer.
--
-- Returns: 
--    NIL.
--]]
local function open_floating_file(target_file)
   local expanded_path = expand_path(target_file)

   -- Make sure the file exists, give an error if not
   if vim.fn.filereadable(expanded_path) == 0 then
      vim.notify("TODO file does not exist at directory: " .. expanded_path, vim.log.levels.ERROR)
      return
   end

   -- Create buffer
   local buf = vim.fn.bufnr(expanded_path, true)

   -- Make sure the buffer open correctly, if not, try to create one manually
   if buf == -1 then
      buf = vim.api.nvim_create_buf(false, false)
      vim.api.nvim_buf_set_name(buf, expanded_path)
   end

   -- Deactivate swap for different sessions 
   vim.bo[buf].swapfile = false

   -- Open the window with the configurations defined in the win_config() function
   vim.api.nvim_open_win(buf, true, win_config())

   -- Keymap to close the buffer with q, checks if it's saved, if not, warning (if you found this useful, just uncomment the code below)
   --[[vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '', {
      noremap = true,
      callback = function()
         if vim.api.nvim_get_option_value("modified", {buf = buf}) then
            vim.notify("Save your changes before closing the buffer", vim.log.levels.WARN)
         else
            vim.api.nvim_win_close(0, true)
         end
      end
   })]]--
end

--[[
-- Function that call the other configuration functions.
--
-- Returns:
--    NIL
--]]
local function setup_user_commands(opts)
   -- Checks for an existing target file, if == NIL, search for a todo.md file in the current directory
   local target_file = opts.target_file or "todo.md"

   -- Create the command for the plugin, and use the functions above
   vim.api.nvim_create_user_command("Td", function()
      open_floating_file(target_file)
   end, {})
end

-- Setup = the functions implemented above
M.setup = function(opts)
   setup_user_commands(opts)
end

return M
