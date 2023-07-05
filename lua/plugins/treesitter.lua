
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
    },
    config = function (opts)
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "ruby", "jsonc", "typescript", "javascript", "go" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
    event = { "BufReadPost", "BufNewFile" }
  },
  {
    "windwp/nvim-autopairs",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      }
    },
    event = { "InsertEnter" }
  }
}
