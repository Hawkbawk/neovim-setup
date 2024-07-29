-- Set a whole bunch of options for a sensible vim experience
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.number = true
vim.opt.encoding = "utf-8"

-- For Treesitter folding support
vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
]])

vim.cmd([[
runtime macros/matchit.vim
]])

-- Make tabs a sensible size and uses spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.g.mapleader = " "
-- So we can just use oil. netrw is blegh
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("lazy-setup")
require("keymaps")
require("autocmds")
