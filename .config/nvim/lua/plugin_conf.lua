-- plugin configuration
require("trouble").setup() 

require("wilder").setup({modes = {':', '/', '?'}})

require("nvim-tree").setup({
  disable_netrw = true,
  view = {
    adaptive_size = true,
    float = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

require('onedark').load()

require('lualine').setup {
  options = { theme = 'onedark' },
}

require('telescope').setup({
  defaults = {
    path_display = { shorten = 1 },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
})
require('telescope').load_extension('fzf')

require("symbols-outline").setup {
  auto_close = true,
}
