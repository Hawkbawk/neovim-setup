local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use {
    'junegunn/fzf',
    'junegunn/fzf.vim',
    run = function()
      vim.cmd [[
        fzf#install()
      ]]
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  }

  use {
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { {'kyazdani42/nvim-web-devicons', opt = true}, "nvim-lua/lsp-status.nvim" },
  }

  use {
    "tpope/vim-endwise"
  }

  use { "akinsho/toggleterm.nvim", tag = '*',
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        terminal_mappings = true,
        direction = 'float',
        auto_scroll = true,
        float_opts = {
          border = "shadow"
        },
        autochdir = false,
      }
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
