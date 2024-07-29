return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "AndreM222/copilot-lualine"
    },
    opts = function()
      return {
        sections = {
          lualine_x = {
            "copilot", "encoding", "fileformat", "filetype",
          }
        },
        options = {
          theme = "gruvbox",
        }
      }
    end

  }
}
