local fzf = require("fzf-lua")
local wk = require("which-key")
local opts = { noremap = true, silent = true }

-- Move around windows easier
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

wk.register({
  f = {
    name = "Find Things",
    f = { fzf.files, "Find Files" },
    q = { fzf.quickfix, "Quickfix List" },
    g = { fzf.live_grep_native, "Live Grep" },
    s = { fzf.lsp_document_symbols, "Find Document Symbols" },
    S = { fzf.lsp_workspace_symbols, "Find Workspace Symbols" },
    b = { fzf.buffers, "Pick Buffer" },
    h = { fzf.help_tags, "Find Help" },
  },
  t = {
    name = "Trouble",
    t = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Toggle Quickfix" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Open Document Diagnostics" },
  },
  k = { vim.lsp.buf.signature_help, "Signature Help" },
  r = { vim.lsp.buf.rename, "Rename Variable" },
  e = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" }
}, { prefix = "<leader>" })

wk.register({
  K = { vim.lsp.buf.hover, "Hover" },
  g = {
    r = { fzf.lsp_references, "Search References" },
    d = { fzf.lsp_definitions, "Go-To Definition(s)" },
    i = { fzf.lsp_implementations, "Go-To Implementation" },
  }
})
