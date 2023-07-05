
local wk = require("which-key")


local opts = { noremap = true, silent = true }

-- Move around windows easier
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
-- Exit the terminal easier
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

vim.keymap.set("n", "<ESC>", "<cmd>noh<cr><esc>", opts)

wk.register({
  l = { "<cmd>Lazy<cr>", "Open Lazy panel" }
}, { prefix = "<leader>" })

