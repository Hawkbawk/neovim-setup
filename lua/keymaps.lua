local telescope = require("telescope.builtin")
local opts = { noremap = true, silent = true }

-- Move around windows easier
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<Leader>f', function()
  telescope.find_files()
end, opts)
vim.keymap.set('n', '<Leader>p', telescope.live_grep, opts)
vim.keymap.set('n', '<Leader>cl', telescope.colorscheme, opts)
vim.keymap.set('n', '<Leader>e', ":NERDTreeToggle<CR>", opts)

-- LSP bindings. Technically these should be in the on_attach, but it's nicer to have everything in one place
local bufopts = { noremap = true, silent = true }

vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "<Leader>k", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
