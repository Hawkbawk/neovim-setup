local api = vim.api

-- Use q to quickly close these transients buffers. Add more as necessary.
api.nvim_create_autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo", "git", "vim" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- Automatically format files according to LSP before writing out to disk.
api.nvim_create_autocmd(
  "BufWritePre",
  {
    pattern = "*",
    callback = function (event)
      vim.lsp.buf.format()
    end
  }
)

vim.cmd [[
  " Exit Vim if NERDTree is the only window remaining in the only tab.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]]
