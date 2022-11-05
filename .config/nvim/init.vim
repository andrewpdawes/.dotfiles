" ===========================================================================
" MY VIMRC
" ===========================================================================
"
" --> PLUGINS ------------------------------------------------------------------- {{{1

" Install Vim-Plug if its not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $VIMRC
endif


" Call VimPlug
" ------------
call plug#begin('~/.vim/plugged')


" Files
" -----
Plug 'vim-scripts/grep.vim'   " integrates grep and (ag, ripgrep, ack etc)
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Appearance
" ----------
Plug 'vim-scripts/CSApprox'   " enable gvim- colorschemes in terminal vim
Plug 'arcticicestudio/nord-vim'
Plug 'frenzyexists/aquarium-vim'


" Editing
" -------
Plug 'tpope/vim-commentary'   " add and remove comments
Plug 'Raimondi/delimitMate'   " automatically close quotes, parens etc
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'simnalamburt/vim-mundo'
Plug 'roxma/vim-paste-easy'


" Completion
" ----------
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Snippets
" --------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" Finances
" --------
Plug 'anekos/hledger'

" Languages
" ---------
Plug 'sheerun/vim-polyglot'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" web
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'hail2u/vim-css3-syntax'                 " improved css syntax
Plug 'ap/vim-css-color'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" gd-script
Plug 'calviken/vim-gdscript3'

" writing
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'kblin/vim-fountain'
Plug 'ahayworth/ink-syntax-vim'

" Utilities
Plug 'sbdchd/neoformat'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'shaunsingh/nord.nvim'

call plug#end()


" --> KEYBINDINGS --------------------------------------------------------------- {{{1
"
let g:mapleader=" "
let g:maplocalleader="//"

" --> Windows ----------------------------------- {{{2

"Splitting windows
nnoremap <leader>wh :split<CR>
nnoremap <leader>wv :vsplit<CR>

"Navigating windows
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>ww <C-W>w

"Swap top/bottom or left/right split
nnoremap <leader>wr <c-w>R<CR>

"resizing windows
noremap <leader>+ :resize +20<CR>
noremap <leader>- :resize -20<CR>
noremap <leader>< :vertical:resize -20<CR>
noremap <leader>> :vertical:resize +20<CR>
nnoremap <leader>= <C-w>=<CR>

"Break out current window into a new tabview
nnoremap <leader>wt <c-w>T<CR>

"Close every window in the current tabview but the current one
nnoremap <leader>wo <c-w>o<CR>

"close current file
nnoremap <leader>bc :bd<CR>
"edit file in a new buffer
nnoremap <leader>be :e file<CR>
"go to next buffer
nnoremap <leader>bn :bn<CR>
"go to previous buffer
nnoremap <leader>bp :bp<CR>
"show buffer list
nnoremap <leader>bl :ls<CR>
"switch between the two last files
nnoremap <leader>bb <C-^>
"close buffer but leave the horizontal split open
map <leader>bh :bp<bar>sp<bar>bn<bar>bc<CR>
"close buffer but leave the vertical split open
map <leader>bv :bp<bar>vsp<bar>bn<bar>bc<CR>


" --> Editor ------------------------------------ {{{2

"easier save file
nnoremap <leader>w :w!<CR>
"easier save all files
nnoremap <leader>W :wall!<CR>
"easier quit
nnoremap <leader>q :q<CR>
"easier save and quit
nnoremap <leader>wq :wqa<CR>
"open .vimrc
nnoremap <leader>ve :e $MYVIMRC<CR>
"open hledger 2020.journal
nnoremap <leader>vf :e ~/pCloudDrive/administration/finance/2022.journal<CR>
"delete whitespace
nnoremap <leader>ew :FixWhitespace<CR>
"automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>


" --> Search ------------------------------------ {{{2

"un-highlights the search term after a search
nnoremap <silent> <leader><space> :noh<cr>
"open the tagbar
nmap <leader>st :TagbarToggle<CR>


" --> Files ------------------------------------- {{{2

"open and new file
nnoremap <leader>fn :enew <CR>

"fuzzy-finf file
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
    set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif


" invoke Leaderf to find buffer
nnoremap <leader>fb :Leaderf --popup buffer<CR>
" invoke Leaderf to find colorscheme
nnoremap <leader>fc :Leaderf --popup colorscheme<CR>
" invoke Leaderf to find file
nnoremap <leader>ff :Leaderf --popup file<CR>
" invoke Leaderf to find function
nnoremap <leader>fF :Leaderf --popup function<CR>
" invoke Leaderf to find help
nnoremap <leader>fh :Leaderf --popup help<CR>
" invoke Leaderf to find location list
nnoremap <leader>fl :Leaderf --popup loclist<CR>
" invoke Leaderf to find recent files
nnoremap <leader>fr :Leaderf --popup mru<CR>
" invoke Leaderf to find tag
nnoremap <leader>ft :Leaderf --popup tag<CR>
" invoke Leaderf to find quickfix
nnoremap <leader>fq :Leaderf --popup quickfix<CR>

"open Netrw vertically (like Nerdtree)
nnoremap <leader>fx :Lexplore<CR>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :fe <C-R>=expand("%:p:h") . "/" <CR>


" --> Version Control --------------------------- {{{2

"toggle mundo history tree
nmap <leader>gm :MundoToggle<CR>
"open History
nnoremap <leader>gh :History<CR>


" --> Applications ------------------------------ {{{2

"toggle Goyo for focussing on writing
nnoremap <leader>ag :Goyo<CR>
" nnoremap <leader>atv :splitright terminal<CR>
nnoremap <leader>at :rightb vert term<CR>
"open terminal in vim
nnoremap <leader>atb :belowright terminal<CR> 

"VIMWIKI
"Open Vimwiki
nnoremap <leader>vww :e ~/.vimwiki/index.wiki<CR>
nnoremap <leader>vwt :e ~/.vimwiki/index.wiki<CR>


" --> Completion -------------------------------- {{{2



" --> Folding ----------------------------------- {{{2

"" switch folding on or off
"zi
"" toggle current fold open/closed
"za
""close current fold
"zc
"" open all folds
"zR
"" close all folds
"zM
"" expand folds to reveal cursor
"zv
"" move down to top of next fold
"zj
"" move up to bottom of previous fold
"zk


" --> Debugging --------------------------------- {{{2

"Fix list
nnoremap <leader>co :copen<CR>

"Location list
" open the location window for ALE results
nnoremap <leader>lo :lopen<CR>
" close the location window
nnoremap <leader>lc :lclose<CR>
" go to the next item in the location list
nnoremap <leader>ln :lnext<CR>
" go to the previous item in the location list
nnoremap <leader>lp :lprevious<CR>
" toggles the quickfix window only if the errors were present
nnoremap <leader>lw :lwindow<CR>


"--> Writing --------------------------------------- {{{3

" Toggle Goyo
nnoremap <leader>N :Goyo<CR>


" --> Utilities --------------------------------- {{{2

" session management
nnoremap <leader>mo :OpenSession<Space>
nnoremap <leader>ms :SaveSession<Space>
nnoremap <leader>md :DeleteSession<CR>
nnoremap <leader>mc :CloseSession<CR>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv,

" Indent entire file
nnoremap <leader>;; gg=G<CR>


" --> Vim-Plug ---------------------------------- {{{2

"invoke Plug to clean plugins
nnoremap <leader>Pc :PlugClean<CR>
"invoke Plug to install plugins
nnoremap <leader>Pi :PlugInstall<CR>
"invoke Plug to update plugins
nnoremap <leader>Pu :PlugUpdate<CR>
"invoke Plug to upgrade plugins
nnoremap <leader>Pg :PlugUpgrade<CR>
"invoke Plug to see plugin status
nnoremap <leader>Ps :PlugStatus<CR>


  " --> Miscellaneous ----------------------------- {{{2

" Hal9000 sets me right...
nnoremap <Left> :echoe "Just a moment. Just a moment. I've just picked up a fault in the AE-35 unit. Use 'h'"<CR>
nnoremap <Right> :echoe "Just what do you think you're doing, Andy? Andy, I really think I'm entitled to an answer to that question. Use 'l'"<CR>
nnoremap <Up> :echoe "I’m afraid I can’t let you do that Andy. Use 'k'"<CR>
nnoremap <Down> :echoe "This mission is too important for me to allow you to jeopardize it. Use 'j'"<CR>


" --> Help -------------------------------------- {{{2

"open vim help
nnoremap <silent> <leader>?? :help<CR>

" whichkey
let g:mapleader = "<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500


" --> GENERAL ------------------------------------------------------------------- {{{1

" --> Encoding ---------------------------------- {{{2

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" --> Spaces & Tabs ----------------------------- {{{2

set tabstop=4                   " 2 space tab
set expandtab                   " Use spaces for tabs
set softtabstop=4               " 2 space tab
set shiftwidth=4
filetype indent on
filetype plugin on
set autoindent

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif


" --> Searching --------------------------------- {{{2

set path+=**                  " recursive fuzzy finding. Has tab completion
set incsearch                 " search as characters are entered
set hlsearch                  " highlight all matches

" --> Text Line Shortcuts ----------------------- {{{2

nnoremap j gj
nnoremap k gk
nnoremap gV '[v']

" --> Folding ----------------------------------- {{{2

autocmd FileType vim,txt setlocal foldmethod=marker

" --> Misc -------------------------------------- {{{2

inoremap jk <Esc>
nnoremap 0 ^
set nocompatible
set nobackup                      " Dont create backup files
set noswapfile                    " Don't use swapfile
set backspace=indent,eol,start    " Fix backspace indent
set autowrite                     " Automatically save before :next, :make etc
set autoread                      " Automatically reread changed files without asking me anything
set hidden                        " Keep buffers open without showing them on screen
set history=500                   " Keeps 500 items in your history
set lbr                           " Don't wrap line in the middle of a word
set backspace=2                   " Backspace behaves like oter programs
set nowritebackup
set ruler                         " Show the cursor position all the time
set laststatus=2                  " Always show the statusline
set modelines=0                   " Disable modelines as a security precaution
set nomodeline
set complete=.,w,b,u,t,i,kspell

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Set up persistent undo across all files
set undofile
if !isdirectory(".vim/undodir")
    call mkdir(".vim/undodir", "p")
endif
set undodir=".vim/undodir"


" --> AESTHETICS ---------------------------------------------------------------- {{{1
" --> Colorscheme ------------------------------- {{{2

set background=dark
colorscheme monokai-tasty
" colorscheme monokai
" colorscheme gruvbox
" colorscheme iceberg
" colorscheme hybrid
"colorscheme heedypo-dark
:set fillchars+=vert:\

" --> Font -------------------------------------- {{{2

" set guifont=Monaco:h14
set guifont=Hack:h14

" --> Enable syntax highlighting ---------------- {{{2

syntax on

" --> UI layout --------------------------------- {{{2

set number                    " show line numbers
set showcmd                   " show command in status bar
set wildmenu
set lazyredraw
set showmatch                 " highlight matching parenthesis
set fillchars=""              " removes ugly line separators
set guioptions=               " removes scrollbars in MacVim
set scrolloff=10               " see next 3 lines when scrolling
set noerrorbells              " no beeps and whistles

" --> Statusline -------------------------------- {{{2
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{wordcount()[\"words\"]}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=

" mouse support
set mouse=a
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Hack\ 14

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
else
    if $TERM == 'xterm'
        set term=xterm-256color
    endif
endif

if &term =~ '256color'
    set t_ut=
endif


" --> AUTOCOMMANDS -------------------------------------------------------------- {{{1

" stop the cursor moving back one space when leaving insert-mode
autocmd InsertLeave * :normal! `^
set virtualedit=onemore

" autocmd InsertEnter * :set norelativenumber                     " In insert mode show absolute numbers
autocmd InsertLeave * :set relativenumber                       " In Normal mode show relative numbers
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

autocmd FileType * setlocal formatoptions-=r formatoptions-=o "  Stops vim automatically add comment prefix on next line

"Paste without explicitly turning paste on/off
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" Automatically reloads the .vimrc file when it is saved
if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "I am fully operational. " . $MYVIMRC | redraw
        autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "I am fully operational. " . $MYGVIMRC | endif | redraw
    augroup END
endif

" Have vim greet you with a message
autocmd VimEnter * echo 'I was sent by the agency, sir. I was given to understand that you require a valet.'

" Enable auto-complete when a file is opened
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Goyo & Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"" Hledger
autocmd FileType hledger setlocal omnifunc=hledger#complete#omnifunc

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END

" python
" vim-python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
                \ formatoptions+=croq softtabstop=4
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" Syntax highlight
let python_highlight_all = 1

" Close buffer without closing the window
command! Bd :bp | :sp | :bn | :bd

" Neoformat
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" --> PLUGIN CONFIGURATION ------------------------------------------------------ {{{1

" --> Move-line (Vim-Move) ---------------------- {{{2

let g:move_key_modifier = 'C'

" --> Emmet ------------------------------------- {{{2

let g:user_emmet_expandabbr_key = '<Tab>'
" let g:user_emmet_leader_key=','
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
autocmd FileType html,css,javascript.jsx,scss EmmetInstall


" --> Tagbar ------------------------------------ {{{2

let g:tagbar_autofocus = 1

" --> Javascript -------------------------------- {{{2
let g:Javascript_enable_domhtmlcss = 1
augroup vimrc-javascript
    autocmd!
    autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

" --> Grep -------------------------------------- {{{2
"
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" --> Vim Vinegar ------------------------------- {{{2

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


" --> Vim-Mundo (version control - history) ----- {{{2

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" --> Ultisnips --------------------------------- {{{2

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" --> Limelight --------------------------------- {{{2

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_ctermfg = 247

" Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'


" --> Session Management ------------------------ {{{2

let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "yes"
let g:session_autosave = "yes"
let g:session_command_aliases = 1


" --> Completion -------------------------------- {{{2

command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-vimlsp',
  \ 'coc-godot',
  \ ]

set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" --> DO NOT DELETE ------------------------------------------------------------- {{{1

" vim: set ft=vim :





