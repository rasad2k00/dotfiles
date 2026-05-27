-- Transparency
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local highlights = {
			"Normal",
			"LineNr",
			"Folded",
			"NonText",
			"SpecialKey",
			"VertSplit",
			"SignColumn",
			"EndOfBuffer",
			"NeoTreeNormal",
			"NeoTreeNormalNC",
			"NeoTreeFloatBorder",
			"NeoTreeFloatTitle",
			"NormalNC",
			"TablineFill",
			"NormalFloat",
			"FloatBorder",
		}
		for _, name in pairs(highlights) do
			vim.cmd.highlight(name .. " guibg=none ctermbg=none")
		end
	end,
})
