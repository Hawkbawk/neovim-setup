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
  -- Package envelope
  use 'wbthomason/packer.nvim'
  -- Makes git nice to use
  use 'tpope/vim-fugitive'
  -- Makes it easy to change the surrounding text around the current
  -- cursor.
  use 'tpope/vim-surround'
  -- Mason let's us install LSPs and formatters really easily
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- Makes navigating really easy. No more memorizing
  -- random arcane vim movement patterns
  use {
    "ggandor/flit.nvim",
    requires = { "tpope/vim-repeat", "ggandor/leap.nvim" },
    config = function()
      require('leap').add_default_mappings()
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        labeled_modes = "nv",
        multiline = true,
        opts = {}
      }
    end
  }
  -- Fuzzy finder
  use {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  -- Makes it easy to organize key-bindings
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }
  -- Helps you navigate diagnostics/issues from the LSP.
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  -- Treesitter is mostly here for syntax highlighting stuff. It does other
  -- stuff, but I'm not sure what and I also don't use it, so all is well.
  use {
    'nvim-treesitter/nvim-treesitter',
    -- Gotta love endwise that works with treesitter.
    requires = "RRethy/nvim-treesitter-endwise",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- Automagically inserts matching pairs for quotes, brackets, def/end, etc.
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true,
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' }
        }
      }
    end
  }
  -- Autocompletion engine!
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help'
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
  -- Provides a nice window to check progress of LSP install.
  use "j-hui/fidget.nvim"
  -- Some color themes.
  use "olimorris/onedarkpro.nvim"
  use "ellisonleao/gruvbox.nvim"

  -- File tree.
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      require("neo-tree").setup {
        close_if_last_window = true,
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
        buffers = {
          follow_current_file = true,
        }
      }
    end
  }
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
        direction = 'horizontal',
        auto_scroll = true,
        autochdir = false,
      }
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
