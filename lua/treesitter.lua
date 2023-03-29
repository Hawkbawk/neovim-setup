require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "ruby", "go", "vim", "lua", "help" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(lang, buf)
      local max_filesize = 250 * 1024 -- 250 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  indentation = {
    enable = true,
  },
  folding = {
    enable = false,
  },
  endwise = {
    enable = true,
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldnestmax = 5
vim.opt.foldminlines = 5
