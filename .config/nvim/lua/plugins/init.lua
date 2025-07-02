return {
  'andymass/vim-matchup',
  'bronson/vim-visual-star-search',
  {
    'chentoast/marks.nvim',
    event = "VeryLazy",
    opts = {},
  },
  'godlygeek/tabular',
  'itspriddle/vim-marked',
  'ludovicchabant/vim-gutentags',
  'neovim/nvim-lspconfig',
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
      }
    end,
  },
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'tyru/open-browser.vim',
  'vim-test/vim-test',
  {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup({
        mode = "document_diagnostics"
      })
    end
  },
  {
    'gelguy/wilder.nvim',
    config = function() require('config/wilder') end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim',
    },
    config = function() require('config/nvim-cmp') end,
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lualine').setup {
        options = { theme = 'onedark' },
      }
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function() require('config/telescope') end,
  },
  {
    'preservim/vim-pencil',
    dependencies = {
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
          vim.cmd("call pencil#init({'wrap': 'hard'})")
          vim.cmd("call litecorrect#init()")
          vim.cmd("call textobj#quote#init()")
          vim.cmd("call textobj#sentence#init()")
        end
      })
    end
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
      })
    end
  },
}
