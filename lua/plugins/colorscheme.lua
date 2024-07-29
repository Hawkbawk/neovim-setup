
return {
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.background = "light"
      vim.cmd [[colorscheme gruvbox]]
    end,
  }
}
