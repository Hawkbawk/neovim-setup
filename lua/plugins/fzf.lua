
return {
  {
  "ibhagwan/fzf-lua",
  config = function(opts)
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
  end,
  keys = {
      {
        "<leader>f",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").live_grep()
        end,
        desc = "Live Grep"
      },
      {
        "<leader>o",
        function()
          require("fzf-lua").oldfiles()
        end,
        desc = "Find in Old Files"
      }
    },
  }
}
