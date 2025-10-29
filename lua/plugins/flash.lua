return {
   "folke/flash.nvim",
   event = { 'BufReadPre', 'BufNewFile' },
   ---@type Flash.Config
   opts = {},
   -- stylua: ignore
   keys = {
      { "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
   },
}
