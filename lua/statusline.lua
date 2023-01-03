require('lualine').setup {
  sections = { lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" } }
}
