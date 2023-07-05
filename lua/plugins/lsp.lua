
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        "mason.nvim",
        { "folke/neodev.nvim", opts = {} },
        {
          "williamboman/mason.nvim",
          event = "VeryLazy",
          keys = "<cmd>Mason<cr>",
          cmd = "Mason",
          config = function()
            require("mason").setup()
          end
        }
      },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "tsserver",
          "solargraph"
        },
        automatic_installation = true

      })
      require("mason-lspconfig").setup_handlers({
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
      })
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
      }
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { 'stylua' },
        handlers = {},
      })
    end,
  },
  keys = {
    {
      "K",
      vim.lsp.buf.hover,
      desc = "Hover"
    },
  }
}
