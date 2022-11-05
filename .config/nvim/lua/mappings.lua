-- ====================================================
-- KEYBINDINGS
-- ====================================================

-- Windows
-- ===============================

-- splitting windows
vim.keymap.set('n', '<leader>wh', ':split<CR>')
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>')

-- navigating windows
vim.keymap.set('n', '<leader>h', '<C-W>h')
vim.keymap.set('n', '<leader>j', '<C-W>j')
vim.keymap.set('n', '<leader>k', '<C-W>k')
vim.keymap.set('n', '<leader>l', '<C-W>l')
vim.keymap.set('n', '<leader>ww', '<C-W>w')

-- swap top/bottom or left/right split
vim.keymap.set('n', '<leader>ws', '<C-W>R<CR>')

-- resizing windows
vim.keymap.set('n', '<leader>+', ':resize +20<CR>')
vim.keymap.set('n', '<leader>-', ':resize -20<CR>')
vim.keymap.set('n', '<leader><', ':vertical:resize +20<CR>')
vim.keymap.set('n', '<leader>>', ':vertical:resize -20<CR>')
vim.keymap.set('n', '<leader>=', '<C-W>=<CR>')

-- break out current window into a new tabview
vim.keymap.set('n', '<leader>wt', '<C-W>T<CR>')

-- close every window other than the current one
vim.keymap.set('n', '<leader>wo', '<C_W>o<CR>')

-- close current file
vim.keymap.set('n', '<leader>bc', 'bd')

-- edit file in a new buffer
vim.keymap.set('n', '<leader>be', ':e file<CR>')

-- go to next buffer
vim.keymap.set('n', '<leader>bn', 'bn')

-- go to previous buffer
vim.keymap.set('n', '<leader>bp', 'bp')

-- show buffer list
vim.keymap.set('n', '<leader>bl', 'bl')

-- switch between the two last files
vim.keymap.set('n', '<leader>bb', '<C-^>')

-- close buffer but leave the horizontal split open
vim.keymap.set('n', '<leader>bh', ':bp<bar>sp<bar>bn<bar>bc<CR>')

-- close buffer but leave the vertical split open
vim.keymap.set('n', '<leader>bv', ':bp<bar>vsp<bar>bn<bar>bc<CR>')

-- Editor
-- ===================================

-- easier save file
vim.keymap.set('n', '<leader>w ', ':w!')

-- easier save all files
vim.keymap.set('n', '<leader>W', ':wall!')

-- easier quit
vim.keymap.set('n', '<leader>q ', ':q')

-- easier save and quit
vim.keymap.set('n', '<leader>wq', ':wqa')

-- open .init.lua
vim.keymap.set('n', '<leader>ve ', ':e .config/nvim/')

-- open hledger journal
vim.keymap.set('n', '<leader>vf', ':e ~/pCloudDrive/administration/finance/2022.journal')

-- delete whitespace
vim.keymap.set('n', '<leader>ew ', ':FixWhitespace')

-- automatically close braces
vim.keymap.set('n', '<leader>{', '{<CR><ESC>ko<tab>')
vim.keymap.set('n', '<leader>[', '[<CR><ESC>ko<tab>')
vim.keymap.set('n', '<leader>(', '(<CR><ESC>ko<tab>')

-- Search
-- ===============================================

-- un-highlights the search term after a search
vim.keymap.set('n', '<leader><space>', ':nohl')

-- open the tagbar
vim.keymap.set('n', '<leader>st', ':TagbarToggle')

-- Files
-- ===============================================

-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- open Netrw vertically (like NerdTree)
vim.keymap.set('n', '<leader>fx', ':Lexplore')

-- Version Control
-- ===============================================

-- toggle mundo history tree
vim.keymap.set('n', '<leader>gm', ':MundoToggle<CR>')

-- open history
vim.keymap.set('n', '<leader>gh', ':History')

-- Applications
-- ===============================================

-- toggle Goyo for focussing on writing
vim.keymap.set('n', '<leader>ag', ':Goyo<CR>')

-- make terminal split right
vim.keymap.set('n', '<leader>at', ':rightb vert term')

-- open terminal
vim.keymap.set('n', '<leader>atb', ':belowright terminal')

-- vimwiki
vim.keymap.set('n', '<leader>vww', ':e ~/.vimwiki/index.wiki<CR>')

-- Debugging
-- ================================================

-- Fixlist
vim.keymap.set('n', '<leader>co', ':copen<CR>')

-- Location list
-- open the location window
vim.keymap.set('n', '<leader>lo', ':lopen<CR>')
-- close the location window
vim.keymap.set('n', '<leader>lc', ':lclose<CR>')
-- go to the next item in the location list
vim.keymap.set('n', '<leader>ln', ':lnext<CR>')
-- go to the previous item in the location list
vim.keymap.set('n', '<leader>lp', ':lprevious<CR>')
-- toggles the quickfix window only if there are errors present
vim.keymap.set('n', '<leader>lw', 'lwindow<CR>')

-- Utilities
-- ================================================

-- session management
vim.keymap.set('n', '<leader>mo', ':OpenSession<Space>')
vim.keymap.set('n', '<leader>ms', ':SaveSession<Space>')
vim.keymap.set('n', '<leader>md', ':DeleteSession<Space>')
vim.keymap.set('n', '<leader>mc', ':CloseSession')

-- maintain visual mode after shifting > and <
vim.keymap.set('v', '<leader><', '<gv>')
vim.keymap.set('v', '<leader>>', '>gv>')

-- move line or visually selected block - alt+j/k
vim.keymap.set('n', '<A-J>', '<ESC>:m .+1<CR>==gi')
vim.keymap.set('n', '<A-k>', '<ESC>:m .+2<CR>==gi')

-- indent entire file
vim.keymap.set('n', '<leader>;;', 'gg=G<CR>')

-- text line shortcuts
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'gV', '[v')

-- escape remapping
vim.keymap.set('i', 'jk', '<ESC>')

-- Miscellaneous
-- =================================================

-- Hal9000 sets me right...
vim.keymap.set('n', '<Left>', ':echoe "Just a moment. Just a moment. There is a fault in the AE-35 unit. Use 'h' "')

vim.keymap.set('n', '<Right', ':echoe "Just what do you think you are doing, Andy? Andy, I really think I am entitled to an answer to that question. Use 'l' "')

vim.keymap.set('n', '<Up>', ':echoe "I am afraid I cannot let you do that Andy. Use 'k' "')

vim.keymap.set('n', '<Down>', ':echoe "This mission is too important for me to allow you to jeopardise it. Use 'j' "')

-- Help
-- =================================================

-- open vim help
vim.keymap.set('n', '<leader>?? ', ':help ')



