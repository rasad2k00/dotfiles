return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"arkav/lualine-lsp-progress"
	},
	config = function()
		require("lualine").setup({
			opts = {
				theme = "dracula",
			},
			sections = {
				lualine_c = {
					"filename",
					{
						'lsp_progress',
						display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' } },
					}
				},
			},
		})
	end,
}
