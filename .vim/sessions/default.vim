" ~/.vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 16 January 2022 at 21:49:01.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'heedypo-darktoo' | colorscheme heedypo-darktoo | endif
call setqflist([])
let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +108 .config/nvim/init.vim
badd +1 pCloudDrive/Repos/mardybumgames/x.MyModularPlugins/GameTemplates/RPGTemplate/Scripts/Player.gd
badd +0 pCloudDrive/Repos/mardybumgames/x.MyModularPlugins/GameTemplates/RPGTemplate/Scripts/Bat.gd
badd +0 .config/nvim/colors/heedypo-darktoo.vim
argglobal
%argdel
edit pCloudDrive/Repos/mardybumgames/x.MyModularPlugins/GameTemplates/RPGTemplate/Scripts/Bat.gd
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 83 + 127) / 255)
exe 'vert 2resize ' . ((&columns * 71 + 127) / 255)
exe 'vert 3resize ' . ((&columns * 99 + 127) / 255)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 33 - ((32 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 021|
lcd ~/
wincmd w
argglobal
if bufexists("~/.config/nvim/init.vim") | buffer ~/.config/nvim/init.vim | else | edit ~/.config/nvim/init.vim | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
5
silent! normal! zo
107
silent! normal! zo
113
silent! normal! zo
159
silent! normal! zo
181
silent! normal! zo
189
silent! normal! zo
224
silent! normal! zo
232
silent! normal! zo
242
silent! normal! zo
248
silent! normal! zo
268
silent! normal! zo
283
silent! normal! zo
289
silent! normal! zo
306
silent! normal! zo
320
silent! normal! zo
329
silent! normal! zo
606
silent! normal! zo
let s:l = 42 - ((26 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
42
normal! 079|
lcd ~/
wincmd w
argglobal
if bufexists("~/.config/nvim/colors/heedypo-darktoo.vim") | buffer ~/.config/nvim/colors/heedypo-darktoo.vim | else | edit ~/.config/nvim/colors/heedypo-darktoo.vim | endif
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 51 - ((32 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
51
normal! 060|
lcd ~/
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 83 + 127) / 255)
exe 'vert 2resize ' . ((&columns * 71 + 127) / 255)
exe 'vert 3resize ' . ((&columns * 99 + 127) / 255)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFA
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

2wincmd w
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
