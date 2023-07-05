local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local easy_quit_group = augroup("easy_quit_group", {})
local line_num_group = augroup("line_num_group", {})

autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lspinfo", "git", "vim", "checkhealth", "fugitiveblame", "log", "oil" },
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = easy_quit_group
})

-- For some filetypes, it makes more sense to quit using ESC in addition
-- to just q
autocmd("FileType", {
  pattern = { "oil", "lazy" },
  command = [[nnoremap <buffer><silent> <ESC> :quit<CR>]],
  group = easy_quit_group
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


