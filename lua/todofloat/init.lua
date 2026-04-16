local M = {}

--- Get the expanded path from the home directory.
--- @param path string Relative path to the target file.
--- @return string extended_path Extended path for the target file.
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

--- Find the center of the screen.
--- @param outer integer Total number of lines.
--- @param inner integer Desired buffer size (horizontally or vertically).
--- @return number coordinate Coordinate to the center of the screen.
local function center(outer, inner)
   return (outer - inner) / 2
end

--- Set the configurations of the buffer we're trying to open.
--- @return vim.api.keyset.win_config config Table with the options.
local function win_config()
   local width = math.floor(vim.o.columns * 0.4)
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

--- Create, open and set keymaps for the TODO buffer.
--- @param target_file string Path to the target file.
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
end

--- Init function.
--- @param opts table Configuration options containing the `target_file`.
local function setup_user_commands(opts)
   -- Checks for an existing target file, if == NIL, search for a todo.md file in the current directory
   local target_file = opts.target_file or "todo.md"

   -- Create the command for the plugin, and use the functions above
   vim.api.nvim_create_user_command("Td", function()
      open_floating_file(target_file)
   end, {})
end

M.setup = function(opts)
   setup_user_commands(opts)
end

return M
