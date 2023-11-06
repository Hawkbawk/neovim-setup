
return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      skip_confirm_form_simple_edits = true,
      keymaps = {
        ["l"] = "actions.select",
        ["h"] = "actions.parent",
      },
      float = {
        padding = 4,
        win_options = {
          winblend = 0
        }
      }
    },
    cmd = "Oil",
    keys = {
      {
        "<leader>e",
        function()
          require("oil").toggle_float()
        end,
        desc = "File Explorer (Current File's Directory)"
      },
      {
        "<leader>E",
        function()
          require("oil").toggle_float(vim.loop.cwd())
        end,
        desc = "File Explorer (CWD)"
      }
    },
  }
}
