-------------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------
-- Only options that deviate from Neovim's own defaults are set here.
-- Run `nvim --clean` and `:set <option>?` to check a default before
-- adding a new line.

local g = vim.g
local opt = vim.opt
local opt_global = vim.opt_global

-- disable language provider support (use lua and vimscript plugins only)
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0

-- disable unused stuff
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_matchit = 1  -- use vim-matchup
g.loaded_matchparen = 1  -- use vim-matchup

-- basic settings
opt.completeopt = { "menu", "menuone", "noinsert" }
opt_global.shortmess:remove("F")
opt.startofline = true
opt.clipboard = 'unnamedplus'
opt.textwidth = 73
opt.maxmempattern = 2000000 -- avoid E363 on complex regexes/large files

-- wait time
opt.timeoutlen = 300 -- faster which-key/leader popups than the 1000ms default
opt.ttimeoutlen = 100

-- display
opt.showmatch = true -- show matching brackets
opt.scrolloff = 3 -- always show 3 rows from edge of the screen
opt.synmaxcol = 300 -- stop legacy regex syntax highlighting after x columns for performance

opt.foldenable = false
opt.foldlevel = 4 -- limit folding to 4 levels
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.wrap = false --do not wrap lines even if very long
opt.eol = false -- show if there's no eol char
opt.showbreak = '↪' -- character to show when line is broken

opt.termguicolors = true

-- sidebar
opt.number = true -- line number on the left
opt.numberwidth = 3 -- always reserve 3 spaces for line number
opt.signcolumn = 'yes' -- reserve 1 column so LSP diagnostics/gitsigns don't shift text
opt.modelines = 0 -- ignore modelines (security: untrusted files can't set options this way)

-- search
opt.ignorecase = true -- ignore letter case when searching
opt.smartcase = true -- case insensitive unless capitals used in search

-- undo: keep the default undo/backup/swap directories (~/.local/state/nvim/*)
-- rather than storing them under this config dir.
opt.undofile = true

-- text format
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true -- expand tab to spaces
