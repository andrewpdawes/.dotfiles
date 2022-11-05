-- ====================================================
-- SETTINGS
-- ====================================================

HOME = os.getenv("HOME")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- basic settings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.encodings = "utf-8"
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.completeopt = 'menuone,noselect'
vim.opt.history = 1000
vim.opt.dictionary = '/usr/share/dict/words'
vim.opt.startofline = true
vim.opt.complete = '.,w,b,u,t,i,kspell'

-- Mapping waiting time
vim.opt.timeout = false
vim.opt.timeout = true
vim.opt.timeoutlen = 100

-- Display
vim.opt.showmatch  = true -- show matching brackets
vim.opt.scrolloff = 5 -- always show 5 rows from edge of the screen
vim.opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.opt.laststatus = 2 -- always show status line
vim.opt.showcmd = true -- show commands pressed
vim.opt.showcmd = true -- display command in bottom bar
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.fillchars = "" -- removes ugly line separators
vim.opt.guioptions =   -- removes scrollbars on macvim
vim.opt.noerrorbells = true -- no beeps and whistles
vim.opt.list = false -- do not display white characters
vim.opt.foldenable = true
vim.opt.foldlevel = 4 -- limit folding to 4 levels
vim.opt.foldmethod = 'manual' -- define folding manually (zf)
vim.opt.wrap = true --wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
vim.opt.showbreak= '↪' -- character to show when line is broken

-- Sidebar
vim.opt.number = true -- line number on the left
vim.opt.numberwidth = 3 -- always reserve 3 spaces for line number
vim.opt.signcolumn = 'yes' -- keep 1 column for coc.vim  check
vim.opt.modelines = 0

-- Search
vim.opt.incsearch = true -- starts searching as soon as typing, without enter needed
vim.opt.hlsearch = true -- highlight all matches
vim.opt.ignorecase = true -- ignore letter case when searching
vim.opt.smartcase = true -- case insentive unless capitals used in search
vim.opt.matchtime = 2 -- delay before showing matching paren
vim.opt.mps = vim.o.mps .. ",<:>"
vim.opt.path = "+=**"

-- White characters
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2 -- 1 tab = 2 spaces
vim.opt.shiftwidth = 2 -- indentation rule
vim.opt.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.opt.expandtab = true -- expand tab to spaces

-- Backup files
vim.opt.backup = true -- use backup files
vim.opt.writebackup = false
vim.opt.swapfile = false -- do not use swap file
vim.opt.undodir = HOME .. '/.vim/tmp/undo//'     -- undo files
vim.opt.backupdir = HOME .. '/.vim/tmp/backup//' -- backups
vim.opt.directory = '/.vim/tmp/swap//'   -- swap files

vim.cmd([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
]])

-- Commands mode
vim.opt.wildmenu = true -- on TAB, complete options for system command
vim.opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- Only show cursorline in the current window and in normal mode.
vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

-- Asthetics

-- colorscheme
vim.opt.background = 'dark'
vim.opt.fillchars = (eob = 'a')

vim.cmd('colorscheme monokai-tasty')
-- vim.cmd('colorscheme monokai')
-- vim.cmd('colorscheme heedypo-dark')
-- vim.cmd('colorscheme iceberg')

-- font
vim.opt.guifont = { "Hack", "h12" }

-- vim.g.python3_host_prog = "/Users/grzegorz/.asdf/shims/python3"
-- vim.g.python_host_prog = "/Users/grzegorz/.asdf/shims/python2"

