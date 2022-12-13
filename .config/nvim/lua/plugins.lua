-- Automatically install packer if it does not exist
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'aklt/plantuml-syntax'
  use 'bronson/vim-visual-star-search'
  use {
    'chentoast/marks.nvim',
    config = function ()
      require("marks").setup()
    end
  }
  use 'ellisonleao/glow.nvim'
  use {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup({
        mode = "document_diagnostics"
      })
    end
  }
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup()
    end
  }
  use {
    'gelguy/wilder.nvim',
    config = function() require('config/wilder') end,
  }
  use 'godlygeek/tabular'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim',
    },
    config = function() require('config/nvim-cmp') end,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function() require('config/nvim-tree') end,
  }
  use 'ludovicchabant/vim-gutentags'
  use 'mfussenegger/nvim-dap'
  use 'mfussenegger/nvim-jdtls'
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = { theme = 'onedark' },
      }
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-telescope/telescope-dap.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function() require('config/telescope') end,
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require('config/nvim-treesitter') end,
  }
  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup {
        auto_close = true,
      }
    end
  }
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tyru/open-browser.vim'
  use 'andymass/vim-matchup'
  use 'vim-test/vim-test'
  use 'weirongxu/plantuml-previewer.vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
