local telescope = require("telescope.builtin")
local wk = require("which-key")
local telescope_custom_pickers = require("telescope_custom_pickers")
local opts = { noremap = true, silent = true }

-- Move around windows easier
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '/', telescope.current_buffer_fuzzy_find, opts)

wk.register({
  f = {
    name = "Find Things",
    f = { telescope.find_files, "Find Files" },
    q = { telescope.quickfix, "Quickfix List" },
    g = { telescope_custom_pickers.live_grep, "Live Grep" },
    s = { telescope.lsp_document_symbols, "Find Document Symbols" },
    S = { telescope.lsp_workspace_symbols, "Find Workspace Symbols" },
    b = { telescope.buffers, "Pick Buffer" },
    h = { telescope.help_tags, "Find Help" },
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
    r = { telescope.lsp_references, "Search References" },
    d = { telescope.lsp_definitions, "Go-To Definition(s)" },
    i = { telescope.lsp_implementations, "Go-To Implementation" },
  }
})
