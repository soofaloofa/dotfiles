" ---------------
" vim-plug
" ---------------
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction
endif

" ----------------------------------------
" Plugin List
" ----------------------------------------
Plug 'andymass/vim-matchup'
Plug 'c9s/bufexplorer'
Plug 'folke/trouble.nvim'
Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
Plug 'godlygeek/tabular'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'kana/vim-textobj-user' " required for vim-textobj-quote/sentence
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/vista.vim'
Plug 'itspriddle/vim-marked'
Plug 'majutsushi/tagbar'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nelstrom/vim-qargs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

syntax on
filetype plugin indent on

" -------
" Globals
" -------
let g:loaded_perl_provider = 0  " Disable perl provider
let g:loaded_ruby_provider = 0  " Disable ruby provider
let g:loaded_node_provider = 0  " Disable node provider
let g:loaded_python_provider = 0  " Disable python2 provider

if executable('python')
 let g:python3_host_prog=exepath('python')
endif

" Do not load netrw by default, see https://github.com/bling/dotvim/issues/4
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:netrw_liststyle = 3

" Do not load tohtml.vim
let g:loaded_2html_plugin = 1

let g:loaded_tutor_mode_plugin = 1  " do not load the tutor plugin

" Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
let g:loaded_matchit = 1
let g:loaded_matchparen = 1

" ---------------
" Whitespace and Tabs
" ---------------
if has("autocmd")
  autocmd BufWritePre *.py,*.txt,*.java,*.md :call <SID>StripTrailingWhitespaces()
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType jade setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType eco setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType java setlocal ts=2 sts=2 sw=2 expandtab 
  autocmd FileType r setlocal ts=2 sts=2 sw=2 expandtab commentstring=#\ %s
  autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal expandtab foldmethod=indent foldlevel=99 
  autocmd FileType dart setlocal ts=2 sts=2 sw=2 expandtab

  " strips trailing whitespace at the end of files. this
  " is called on buffer write in the autogroup above.
  function! <SID>StripTrailingWhitespaces()
      " save last search & cursor position
      let _s=@/
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      let @/=_s
      call cursor(l, c)
  endfunction
endif

" ---------------
" Color
" ---------------
if (has("termguicolors"))
  set termguicolors
endif
colorscheme solarized8

highlight Comment cterm=italic  
" Disable search highlighting by pressing enter
nnoremap <CR> :nohlsearch<CR><CR>   
" color column 80, and 120 onwards
let &colorcolumn="80,".join(range(120,999),",") 

" ---------------
" Terminal
" ---------------
tnoremap <Esc> <C-\><C-n>

" ---------------
" Backups
" ---------------
set backup
set noswapfile
set backupdir=$HOME/.config/nvim/backup
set directory=$HOME/.config/nvim/tmp

" ---------------
" Undo
" ---------------
set undodir=$HOME/.config/nvim/undo " where to save undo histories
set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set relativenumber " Relative line numbers on
set number         " Line numbers on
set nowrap           " Line wrapping on
set textwidth=74
set laststatus=2   " Always show the statusline
set showcmd
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
set linespace=7
set cursorline
set lazyredraw
if !&scrolloff
  set scrolloff=999
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline
set guifont=Sauce\ Code\ Powerline:h20

" Change the cursor in different modes
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ---------------
" Behaviors
" ---------------
set autoread           " Automatically reload changes if detected
set fileformats+=mac
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set formatoptions=crql
set spelllang=en_ca
set iskeyword+=$,@     " Add extra characters that are valid parts of variables

""""""""""""" key map timeouts
"
" By default Vim will only wait 1 second for each keystroke in a mapping.
" You may find that too short with the above typemaps.  If so, you should
" either turn off mapping timeouts via 'notimeout'.
"
" set notimeout 
"
" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
" with your own personal favorite value (in milliseconds):
"
set timeoutlen=1000
"
" Either way, since mapping timeout settings by default also set the
" timeouts for multicharacter 'keys codes' (like <F1>), you should also
" set ttimeout and ttimeoutlen: otherwise, you will experience strange
" delays as vim waits for a keystroke after you hit ESC (it will be
" waiting to see if the ESC is actually part of a key code like <F1>).
"
set ttimeout 
"
" personally, I find a tenth of a second to work well for key code
" timeouts. If you experience problems and have a slow terminal or network
" connection, set it higher.  If you don't set ttimeoutlen, the value for
" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
"
set ttimeoutlen=0


" ---------------
" Text Format
" ---------------
set tabstop=2
set shiftwidth=2 " Tabs under smart indent
set softtabstop=2
set cindent
set autoindent
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set smarttab
set expandtab

" ---------------
" Folding
" ---------------
set foldenable
set foldlevelstart=10  " Only fold 10 levels deep
set foldnestmax=10     " Max of 10 folds
set foldmethod=indent  " Fold on indent level
nnoremap <silent> <Space> za
vnoremap <Space> zf

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set hlsearch
" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" ---------------
" Sounds
" ---------------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" ---------------
" Conceal
" ---------------
set conceallevel=1
au FileType * setl conceallevel=1 
let g:vim_json_conceal=0  " disable in json files

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" ---------------
" Show whitespace
" ---------------
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR> 

" ---------------
" Preserve last substitution flags
" ---------------
nnoremap & :&& <CR>
xnoremap & :&& <CR>


" ----------------------------------------
" Plugin Configuration
" ----------------------------------------
lua << EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.vale,
    },
})
EOF

lua << EOF
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
EOF

" ---------------
" Marked
" ---------------
nnoremap <leader>mo :MarkedOpen<CR>
nnoremap <leader>mq :MarkedQuit<CR>

" ---------------
" vim-pencil
" ---------------
function! Prose()
  call pencil#init({'wrap': 'hard', 'autoformat': 0})
  call lexical#init()
  call litecorrect#init()
  call textobj#quote#init()
  call textobj#sentence#init()

  let g:lexical#spelllang = ['en_ca']

  let g:pencil#conceallevel = 0     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
  let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)

  " manual reformatting shortcuts
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6
endfunction

" automatically initialize buffer by file type
autocmd FileType markdown,mkd,text call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

" ---------------
" Airline
" ---------------
let g:airline_powerline_fonts=1
let g:airline_section_x = '%{PencilMode()}'
let g:airline_theme = 'solarized'

" ---------------
" Telescope
" ---------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ---------------
" Trouble
" ---------------
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" ---------------
" TagBar
" ---------------
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1

" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeHijackNetrw=1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node of bookmarks
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen=1
