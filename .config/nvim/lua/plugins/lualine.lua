return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			opts = {
				theme = "dracula",
			},
			sections = {
				lualine_c = {
					"filename",
				},
			},
		})
	end,
}
