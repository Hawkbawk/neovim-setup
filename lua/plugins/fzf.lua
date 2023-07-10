
return {
  {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    'max-perf', -- The profile to use, see :h fzf-lua-profiles for options
    previewers = {
      bat = {
        cmd = "bat",
        args = "--color=never --style=numbers"
      }
    },
    files = {
      fd_opts = "--color=never --type f --hidden --no-ignore --exclude node_modules --exclude .git"
    }
  },
  keys = function()
    local fzf = require("fzf-lua")

    return {
      {
        "<leader>ff",
        fzf.files,
        desc = "Find Files",
      },
      {
        "<leader>/",
        fzf.live_grep,
        desc = "Live Grep"
      },
      {
        "<leader>fo",
        fzf.oldfiles,
        desc = "Find in Old Files"
      },
      {
        "<leader>fh",
        fzf.help_tags,
        desc = "Search Help Tags"
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
