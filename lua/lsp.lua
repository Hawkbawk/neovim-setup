require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"tsserver", "ruby_ls", "gopls", "jsonls", "dockerls"}
})

local on_attach = function(client, bufnum)
    vim.api.nvim_buf_set_option(bufnum, "omnifunc", "v:lua.vim.lsp.omnifunc")
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
