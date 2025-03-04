vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- vim.api.nvim_create_autocmd("VimLeave", {
-- 	pattern = "*",
-- 	command = "set guicursor=a:hor20-blinkon1",
-- })
