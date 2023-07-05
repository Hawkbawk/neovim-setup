
return {
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.background = "dark"
      vim.cmd [[colorscheme gruvbox]]
    end,
  }
}
