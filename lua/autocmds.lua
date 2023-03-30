local api = vim.api

-- Use q to quickly close these transients buffers. Add more as necessary.
api.nvim_create_autocmd("FileType", {
	pattern = { "help", "startuptime", "qf", "lspinfo", "git", "vim", "checkhealth", "fugitiveblame", "log" },
	command = [[nnoremap <buffer><silent> q :close<CR>]],
})
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })
api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = [[source ~/.config/nvim/lua/plugins.lua | PackerSync]],
})

-- Automatically format files according to LSP before writing out to disk.
api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(_)
		vim.lsp.buf.format()
	end,
})
