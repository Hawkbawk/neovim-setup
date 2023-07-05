
return {
  {
  "ibhagwan/fzf-lua",
  opts = {
    'telescope', -- The profile to use, see :h fzf-lua-profiles for options
    files = {
      fd_opts = "--color=never --type f --hidden --no-ignore --exclude node_modules --exclude .git"
    }
  },
  keys = function()
    local fzf = require("fzf-lua")

    return {
      {
        "<leader>f",
        fzf.files,
        desc = "Find Files",
      },
      {
        "<leader>/",
        fzf.live_grep,
        desc = "Live Grep"
      },
      {
        "<leader>o",
        fzf.oldfiles,
        desc = "Find in Old Files"
      },
      {
        "gd",
        function()
          fzf.lsp_definitions({ jump_to_single_result = true})
        end,
        desc = "Go-To Definition"
      },
      {
        "gi",
        function()
          fzf.lsp_implementations({jump_to_single_result = true})
        end,
        desc = "Go-To Implementations",
      },
      {
        "gr",
        function()
          fzf.lsp_references({jump_to_single_result = true})
        end,
        desc = "Go-To References"
      }
    }
  end
  }
}
