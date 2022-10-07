return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'bronson/vim-visual-star-search'
  use {
    "folke/trouble.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }
  use {
    'gelguy/wilder.nvim',
    config = function()
      require('wilder').setup({modes = {':', '/', '?'}})
    end,
  }
  use 'godlygeek/tabular'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp' 
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.diagnostics.vale,
        },
      })
    end,
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require("nvim-tree").setup()
    end,
  }
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end,
  }
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme  = 'onedark' },
      }
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")
      local telescope = require("telescope")

      telescope.setup {
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      }
    end,
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'make' 
  } 
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end,
  }
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'vim-test/vim-test'
end)
