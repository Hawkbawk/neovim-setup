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
  -- Makes git nice to use
  use 'tpope/vim-fugitive'
  -- Mason let's us install LSPs and formatters really easily
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- FZF is really, really good at finding things fast, especially with ripgrep.
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
    "ggandor/flit.nvim",
    requires = { "tpope/vim-repeat", "ggandor/leap.nvim" },
    config = function()
      require("leap").add_default_mappings()
      require("flit").setup {}
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Treesitter is mostly here for syntax highlighting stuff. It does other stuff, but I'm not sure what and I also don't use it, so all is well.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Autocompletion engine!
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  }

  -- Snippets
  use {
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
  }

  -- Statusline.
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- Auto insert end for ruby.
  use "tpope/vim-endwise"
  -- Provides a nice window to check progress of LSP install.
  use "j-hui/fidget.nvim"
  -- Some color themes.
  use "olimorris/onedarkpro.nvim"
  use "ellisonleao/gruvbox.nvim"

  -- File tree.
  use "preservim/nerdtree"
  -- Git signs for telling what was changed in a file.
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

  use "folke/neodev.nvim"
  -- A much nicer terminal
  use { "akinsho/toggleterm.nvim", tag = '*',
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        terminal_mappings = true,
        direction = 'float',
        auto_scroll = true,
        float_opts = {
          border = "double"
        },
        autochdir = false,
      }
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
