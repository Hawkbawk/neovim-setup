
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "ruby", "jsonc", "typescript", "javascript", "go" }
    }
  }
}
