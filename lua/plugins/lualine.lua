
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/lsp-status.nvim"
    },
    opts = function()
      local lsp_status = require("lsp-status")
      lsp_status.register_progress()
      return {
        sections = {
          lualine_c = {
            "filename", "require'lsp-status'.status()"
          }
        }
      }
    end

  }
}
