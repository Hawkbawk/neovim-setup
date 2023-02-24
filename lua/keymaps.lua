local telescope = require("telescope.builtin")
local wk = require("which-key")
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
})

vim.keymap.set('n', '<Leader>e', ":Neotree toggle<CR>", opts)

-- LSP bindings. Technically these should be in the on_attach, but it's nicer to have everything in one place
local bufopts = { noremap = true, silent = true }

vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "<Leader>k", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
