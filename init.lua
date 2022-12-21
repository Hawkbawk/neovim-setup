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
-- Make tabs a sensible size and uses spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.cmd("filetype plugin indent on")

vim.g.mapleader = " "

require("plugins")
require("lsp")
require("treesitter")
require("keymaps")
