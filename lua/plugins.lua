

return require('packer').startup(function(use)
	  use 'wbthomason/packer.nvim'
	  use 'tpope/vim-fugitive'
	  use {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
          }
end)
