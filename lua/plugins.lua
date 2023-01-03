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
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use "tpope/vim-endwise"
  use "j-hui/fidget.nvim"
  use "olimorris/onedarkpro.nvim"
  use "ellisonleao/gruvbox.nvim"
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        end
      }
    end
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
