require('nvim-treesitter.configs').setup {
  ensure_installed = {'javascript', 'typescript', 'ruby', 'go'},
  highlight = {
    enable = true
  },
  indentation = {
    enable = true
  },
  folding = {
    enable = false
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldnestmax = 5
vim.opt.foldminlines = 5
