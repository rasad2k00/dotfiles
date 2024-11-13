return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			highlight_overrides = {
				mocha = function(mocha)
					return {
						NormalFloat = { fg = mocha.none, bg = mocha.none },
						NormalFloatBorder = { fg = mocha.none, bg = mocha.none },
						NeoTreeNormal = { fg = mocha.none, bg = mocha.none },
					}
				end,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
