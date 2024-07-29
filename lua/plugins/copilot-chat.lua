return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
    },
    events = 'VeryLazy',
    cmd = {"CopilotChat", "CopilotChatToggle", "CopilotChatOpen", "CopilotChatExplain", "CopilotChatReview" },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<enter>", desc = "Open Copilot Chat" },
    }
  },
}
