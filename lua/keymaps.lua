local telescope = require('telescope.builtin')
local opts = { noremap = true, silent = true }

-- All of the telescope keymaps. There's some overlap here with LSP functions, but telescope gives us a nice picker if multiple definitions or implementations are found.
vim.keymap.set('n', '<Leader>ff', telescope.find_files, opts)
vim.keymap.set('n', '<Leader>rg', telescope.live_grep, opts)
vim.keymap.set('n', '<Leader>gs', telescope.grep_string, opts)
vim.keymap.set('n', '<Leader>cs', telescope.colorscheme, opts)
vim.keymap.set('n', '<Leader>bf', telescope.current_buffer_fuzzy_find, opts)
vim.keymap.set('n', '<Leader>ls', telescope.lsp_document_symbols, opts)
vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)

-- LSP bindings. Technically these should be in the on_attach, but it's nicer to have everything in one place
local bufopts = { noremap = true, silent = true }

vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<Leader>fmt', function() vim.lsp.buf.format { async = true } end, bufopts)
