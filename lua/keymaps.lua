local opts = { noremap = true, silent = true }


-- All the fzf keybindings!
vim.keymap.set('n', '<Leader>ff', ":Files<CR>", opts)
-- For some reason, this can't just be defined in the plugins file when setting up fzf. Not sure why...
vim.cmd([[
        function! RipgrepFzf(query, fullscreen)
          let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
          let initial_command = printf(command_fmt, shellescape(a:query))
          let reload_command = printf(command_fmt, '{q}')
          let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
          call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
        endfunction

        command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
      ]])
vim.keymap.set('n', '<Leader>p', ":RG <CR>", opts)
vim.keymap.set('n', '<Leader>cl', ":Colors<CR>", opts)
vim.keymap.set('n', '<Leader>e', ":NvimTreeToggle<CR>", opts)

-- LSP bindings. Technically these should be in the on_attach, but it's nicer to have everything in one place
local bufopts = { noremap = true, silent = true }

vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<Leader>fmt', function() vim.lsp.buf.format { async = true } end, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
