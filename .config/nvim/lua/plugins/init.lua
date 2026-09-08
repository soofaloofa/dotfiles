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
  'vim-test/vim-test',
  {
    'folke/trouble.nvim',
    opts = {},
  },
  {
    'gelguy/wilder.nvim',
    config = function() require('config/wilder') end,
  },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts_extend = { 'sources.default' },
    opts = {
      signature = { enabled = true },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'bash', 'go', 'gomod', 'gosum', 'gowork', 'javascript', 'json',
        'lua', 'markdown', 'markdown_inline', 'python', 'query', 'rust',
        'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
      })
      vim.api.nvim_create_autocmd('FileType', {
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('config/gitsigns') end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
          auto_integrations = true,
          flavour = "mocha",
      })
      vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = { theme = "catppuccin-nvim" },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
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
          vim.g['pencil#conceallevel'] = 0
          vim.cmd("call pencil#init({'wrap': 'hard'})")
          vim.cmd("call litecorrect#init()")
          vim.cmd("call textobj#quote#init()")
          vim.cmd("call textobj#sentence#init()")
        end
      })
    end
  },
  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require('config/aerial') end,
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
