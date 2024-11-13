-- Transparency
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local highlights = {
			-- "Normal",
			-- "LineNr",
			-- "Folded",
			-- "NonText",
			-- "SpecialKey",
			-- "VertSplit",
			-- "SignColumn",
			-- "EndOfBuffer",
			-- "NeoTreeNormal",
			-- "NeoTreeNormalNC",
			-- "NormalNc",
			-- "TablineFill", -- this is specific to how I like my tabline to look like
			-- "NormalFloat",
			-- "NormalFloatBorder",
		}
		for _, name in pairs(highlights) do
			vim.cmd.highlight(name .. " guibg=none ctermbg=none")
		end
	end,
})
