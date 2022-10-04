HOME = os.getenv("HOME")

-- language provider support
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
-- vim.g.python3_host_prog = "/Users/kevinsookocheff/.config/nvim/neovimvenv/bin/python"

-- disabled
vim.g.loaded = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_matchit = 1  -- use vim-matchup
vim.g.loaded_matchparen = 1  -- use vim-matchup

-- basic settings
vim.cmd('filetype plugin on')
vim.g.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F")
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.history = 1000
vim.opt.startofline = true
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.clipboard = 'unnamedplus'

-- wait time
vim.opt.timeout = false
vim.opt.timeoutlen = 1000
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

-- display
vim.opt.showmatch  = true -- show matching brackets
vim.opt.scrolloff = 3 -- always show 3 rows from edge of the screen
vim.opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.opt.laststatus = 2 -- always show status line

vim.opt.list = false -- do not display white characters
vim.opt.foldenable = false
vim.opt.foldlevel = 4 -- limit folding to 4 levels
vim.opt.foldmethod = 'syntax' -- use language syntax to generate folds
vim.opt.wrap = false --do not wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
vim.opt.showbreak= '↪' -- character to show when line is broken

vim.opt.termguicolors = true
vim.cmd('colorscheme solarized8')

-- sidebar
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 3 -- always reserve 3 spaces for line number
vim.opt.signcolumn = 'yes' -- keep 1 column for coc.vim  check
vim.opt.modelines = 0
vim.opt.showcmd = true -- display command in bottom bar

-- search
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.smartcase = true -- case insentive unless capitals used in search

vim.opt.matchtime = 2 -- delay before showing matching paren
vim.o.mps = vim.o.mps .. ",<:>"

-- backup and undo
vim.opt.backup = true
vim.opt.swapfile = false
vim.opt.backupdir = HOME .. '/.config/nvim/.backup//'
vim.opt.directory = HOME .. '/.config/nvim/.swp//'
vim.opt.undodir = HOME .. '/.config/nvim/.undo//'
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- text format
vim.opt.tabstop = 2 
vim.opt.shiftwidth = 2 
vim.opt.softtabstop = 2 
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.smarttab = true

-- wild menu
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'
vim.opt.wildignorecase = true
