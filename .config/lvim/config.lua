-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.transparent_window = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "autopep8" }, { name = "isort" }, { name = "black" } }

lvim.keys.normal_mode["<C-Left>"] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":vertical resize -2<CR>"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
