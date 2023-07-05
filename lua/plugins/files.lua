
return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,     
      skip_confirm_form_simple_edits = true,
      keymaps = {
        ["l"] = "actions.select",
        ["h"] = "actions.parent",
      }
    },
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
    lazy = false
  }
}