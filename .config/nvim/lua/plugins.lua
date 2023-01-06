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
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require('alpha').setup(require'alpha.themes.startify'.config)
    end
  }
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
    'j-hui/fidget.nvim',
    config = function ()
      require('fidget').setup()
    end
  }
  use 'ludovicchabant/vim-gutentags'
  use {
    'mfussenegger/nvim-dap',
    config = function() require('config/nvim-dap') end,
  }
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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
        window = {
          mappings = {
            ["o"] = "open",
          }
        }
      })
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
    'preservim/vim-pencil',
    requires = {
      'preservim/vim-litecorrect',
      'kana/vim-textobj-user',
      'preservim/vim-textobj-quote',
      'preservim/vim-textobj-sentence',
    },
    config = function()
      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      augroup('pencil', { clear = true })
      autocmd('FileType', {
        group = 'pencil',
        pattern = { "markdown" ,"text" },
        callback = function()
          vim.cmd("call pencil#init()")
          vim.cmd("call litecorrect#init()")
          vim.cmd("call textobj#quote#init()")
          vim.cmd("call textobj#sentence#init()")
        end
      })
    end
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
