require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"tsserver", "ruby_ls", "gopls", "jsonls", "dockerls"}
})

local on_attach = function(client, bufnum)
    vim.api.nvim_buf_set_option(bufnum, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local bufopts = { noremap = true, silent = true, buffer = bufnum }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("mason-lspconfig").setup_handlers({
   -- The first entry (without a key) will be the default handler
   -- and will be called for each installed server that doesn't have
   -- a dedicated handler.
   function (server_name) -- default handler (optional)
       require("lspconfig")[server_name].setup {}
   end,
   -- Next, you can provide targeted overrides for specific servers.
   ["rust_analyzer"] = function ()
       require("rust-tools").setup {}
   end,
   ["sumneko_lua"] = function ()
       require("lspconfig").sumneko_lua.setup {
	   settings = {
	       Lua = {
		   diagnostics = {
		       globals = { "vim" }
		   }
	       }
	   }
       }
   end,
})
