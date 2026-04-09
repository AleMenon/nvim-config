return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	opts = {
        debug = false,
        to_clipboard = true,

        theme = "Dracula",
        font = "CaskaydiaMono Nerd Font",

        background = "#1a1b26",
        shadow_color = "#1a1b26",
        pad_horiz = 80,
        pad_vert = 60,

		line_offset = function(args)
			return args.line1
		end,
	},

    vim.keymap.set({'n', 'v'}, '<leader>cs', function ()
        require("nvim-silicon").clip()
    end, { desc = "[C]ode [S]napshot"}),
}
