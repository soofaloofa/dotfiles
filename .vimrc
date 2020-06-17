" ---------------
" Vundle
" ---------------
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" ----------------------------------------
" Plugin List
" ----------------------------------------
Plug 'altercation/vim-colors-solarized'
Plug 'c9s/bufexplorer'
Plug 'godlygeek/tabular'
Plug 'itspriddle/vim-marked'
Plug 'janko-m/vim-test'
Plug 'kana/vim-textobj-user' " required for vim-textobj-quote/sentence
Plug 'kien/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nelstrom/vim-qargs'
Plug 'neomake/neomake'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'rking/ag.vim'
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
set omnifunc=syntaxcomplete#Complete

" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" Reload Vimrc
" map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Expand current directory when opening a file
" cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ---------------
" Whitespace
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
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
endif

" ---------------
" Color
" ---------------
set t_Co=256
colorscheme solarized
set background=dark

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
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp

" ---------------
" Undo
" ---------------
set undodir=$HOME/.vim/undo " where to save undo histories
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
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set formatoptions=crql
set spelllang=en_ca
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

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
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc

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
set conceallevel=2 
au FileType * setl conceallevel=2 

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
" Files
" ---------------
" Save and restore session
nmap <leader>ss :wa<cr>:mksession! $HOME/.vim/sessions/
nmap <leader>rs :wa<cr>:source $HOME/.vim/sessions/

" Write buffer through sudo
cnoreabbrev w!! w !sudo tee % >/dev/null

" Change current directory to the directory of the file in buffer
nmap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

" Open file located in the same directory as the current one
nmap <leader>e :e <c-r>=expand('%:p:h').'/'<cr>

" ---------------
" vi Tab navigation
" ---------------
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
" nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
" nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" ---------------
" num tabs
" ---------------
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

map! <D-1> <C-O>:tabn 1<CR>
map! <D-2> <C-O>:tabn 2<CR>
map! <D-3> <C-O>:tabn 3<CR>
map! <D-4> <C-O>:tabn 4<CR>
map! <D-5> <C-O>:tabn 5<CR>
map! <D-6> <C-O>:tabn 6<CR>
map! <D-7> <C-O>:tabn 7<CR>
map! <D-8> <C-O>:tabn 8<CR>
map! <D-9> <C-O>:tabn 9<CR>

" ---------------
" Preserve last substitution flags
" ---------------
nnoremap & :&& <CR>
xnoremap & :&& <CR>

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

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ----------------------------------------
" Deoplete
" ----------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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

  " manual reformatting shortcuts
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap

  " force top correction on most recent misspelling
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

  " replace common punctuation
  " iabbrev <buffer> -- –
  " iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6

  " replace typographical quotes (reedes/vim-textobj-quote)
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>

  " toggle pencil format
  noremap <silent> <F7> :<C-u>PFormatToggle<cr>
  inoremap <silent> <F7> <C-o>:PFormatToggle<cr>
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
" TagBar
" ---------------
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1

" ---------------
" CTRL-P
" ---------------
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_show_hidden = 1

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

" ---------------
" vim-test
" ---------------
let test#strategy = "neovim"
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" ---------------
" neomake
" ---------------
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)

" ---------------
" undotree
" ---------------
nnoremap <F5> :UndotreeToggle<cr>

" ---------------
" Rainbow parentheses
" ---------------
let g:rainbow_active = 1
