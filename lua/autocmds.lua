local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local easy_quit_group = augroup("easy_quit_group", {})
local resource_config_group = augroup("resource_config", {})
local format_group = augroup("format_group", {})
local line_num_group = augroup("line_num_group", {})
-- Use q to quickly close these transients buffers. Add more as necessary.
autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lspinfo", "git", "vim", "checkhealth", "fugitiveblame", "log" },
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = easy_quit_group
})
autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = [[source ~/.config/nvim/lua/plugins.lua | PackerSync]],
  group = resource_config_group
})
-- Automatically format files according to LSP before writing out to disk.
autocmd("BufWritePre", {
  pattern = "*",
  group = format_group,
  callback = function(_)
    vim.lsp.buf.format()
  end,
})

autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  pattern = "*",
  group = line_num_group,
  callback = function(_)
    if vim.wo.nu and vim.api.nvim_get_mode()["mode"] ~= "i" then
      vim.wo.rnu = true
    end
  end,
})

autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  pattern = "*",
  group = line_num_group,
  callback = function(_)
    if vim.wo.nu then
      vim.wo.rnu = false
    end
  end

})
