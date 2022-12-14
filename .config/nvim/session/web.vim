" ~/.config/nvim/session/web.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 07 July 2022 at 20:08:31.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'tender' | colorscheme tender | endif
call setqflist([])
let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit ~/.vimwiki/index.wiki
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 85 + 127) / 255)
exe 'vert 2resize ' . ((&columns * 84 + 127) / 255)
exe 'vert 3resize ' . ((&columns * 84 + 127) / 255)
argglobal
balt ~/.vimwiki/HTML.wiki
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 5 - ((4 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 0
wincmd w
argglobal
if bufexists("~/.vimwiki/index.wiki") | buffer ~/.vimwiki/index.wiki | else | edit ~/.vimwiki/index.wiki | endif
if &buftype ==# 'terminal'
  silent file ~/.vimwiki/index.wiki
endif
balt ~/.vimwiki/HTML.wiki
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 5 - ((4 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 0
wincmd w
argglobal
if bufexists("~/.vimwiki/HTML.wiki") | buffer ~/.vimwiki/HTML.wiki | else | edit ~/.vimwiki/HTML.wiki | endif
if &buftype ==# 'terminal'
  silent file ~/.vimwiki/HTML.wiki
endif
balt ~/.vimwiki/index.wiki
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 21 - ((20 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 21
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 85 + 127) / 255)
exe 'vert 2resize ' . ((&columns * 84 + 127) / 255)
exe 'vert 3resize ' . ((&columns * 84 + 127) / 255)
tabnext 1
badd +267 ~/.config/nvim/init.vim
badd +5 .timewarrior/data/2022-06.data
badd +1 pCloudDrive/Repos/mardybumgames/Projects/AtmosphericEric/scripts/player
badd +1 pCloudDrive/Repos/mardybumgames/Projects/AtmosphericEric/scripts/player.g
badd +7 pCloudDrive/Repos/Study/web/angela/web-bootcamp/Ex1/index.html
badd +1 ~/pCloud\ Drive/administration/finance/2022.hledger
badd +6 ~/.vimwiki/index.wiki
badd +1 pCloudDrive/Repos/Study/web/angela/web-bootcamp/Ex1/style.css
badd +21 ~/.vimwiki/HTML.wiki
badd +9 pCloudDrive/Repos/Study/web/angela/web-bootcamp/Ex2/index.html
badd +1 pCloudDrive/Repos/Study/web/angela/web-bootcamp/Ex2/styles.css
badd +11 pCloudDrive/Repos/Study/web/angela/web-bootcamp/Ex2_Personal_Site/index.html
badd +0 pCloudDrive/Repos/Study/web/angela/web-bootcamp/Ex2_Personal_Site/style.css
badd +0 .timewarrior/data/2022-07.data
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFAc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
