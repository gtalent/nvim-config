if has('win32')
	set runtimepath^=~/AppData/Local/nvim runtimepath+=~/.nvim-pack
else
	set runtimepath^=~/.config/nvim runtimepath+=~/.local/share/nvim/site/pack
endif
let &packpath = &runtimepath
set completeopt=menu,menuone,noselect
lua require('plugins')
lua require('nvim-cmp')
lua require('nvim-ts')


function! SudoWrite()
	write !sudo tee % > /dev/null
	load
endfunction

set nospell
function! SpellCheckToggle()
	if &spell
		set nospell
		echo "Spell check off"
	else
		set spell
		echo "Spell check on"
	endif
endfunction

set expandtab
function! TabToggle()
	if &expandtab
		set shiftwidth=3
		set softtabstop=3
		set noexpandtab
		echo "Now using tabs"
	else
		set shiftwidth=4
		set softtabstop=4
		set expandtab
		echo "Now using spaces"
	endif
endfunction

set shiftwidth=3
set softtabstop=3
set noexpandtab

function! MapCommand(key, com)
	execute "map " . a:key . " :" . a:com
	execute "imap " . a:key . " <ESC>" . a:key
endfunction

function! IMapCommand(key, com)
	execute "imap " . a:key . " :" . a:com
endfunction

function! ListToggle()
	if &list
		set nolist
		echo "Show whitespace off"
	else
		set list
		echo "Show whitespace on"
	endif
endfunction

" Ctrl-O
let g:dirOfCurrentFile = expand('%:p:h')
function! SetupOpeners()
	let l:dirOfCurrentFile = expand('%:p:h') . "/"
	"execute "map <C-W> :enew <BAR> edit " . l:dirOfCurrentFile
	call MapCommand("<C-G>", "vsplit " . l:dirOfCurrentFile)
	call MapCommand("<C-O>", "edit " . l:dirOfCurrentFile)
endfunction
call SetupOpeners()
function! OnBufEnter()
	call SetupOpeners()
endfunction


" Key mappings
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-I> <C-W><C-I>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
imap <C-BS> <C-W>
map <C-I> :pop<CR>

call MapCommand("<C-S>", "write<CR>")
map <C-W> :bd<CR>
call MapCommand("<C-TAB>", "bnext<CR>")
call MapCommand("<C-S-TAB>", "bprevious<CR>")
call MapCommand('<leader>u', "UndotreeToggle<CR>")

call MapCommand("<C-F6>", "call ListToggle()<CR>")
call MapCommand("<F7>", "call SpellCheckToggle()<CR>")
call MapCommand("<F8>", "call TabToggle()<CR>")
call MapCommand("<C-F12>", "NERDTreeToggle<CR>")

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" let g:completion_enable_auto_popup = 1
" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

" End Key Mappings

command! SudoWrite :call SudoWrite()

hi DiffDelete ctermfg=0 ctermbg=1 guibg='#FE4747'
hi DiffAdd ctermfg=0 ctermbg=2 guibg='#A5EE87'
hi DiffChange ctermfg=0 ctermbg=3 guibg='#5587F7'
hi Todo guifg=#750000 gui=italic
"hi visual guifg=#ffffff guibg=DeepSkyBlue4

"event handlers

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave filetype * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   filetype * set norelativenumber
augroup END
colorscheme onedark

autocmd! GUIEnter * set visualbell t_vb=
"autocmd! GUIEnter * GuiTabline 0

set viminfo='10,\"100,:20,%

autocmd! BufEnter * call OnBufEnter()

let g:ctrlp_cmd = 'CtrlPBuffer'
let g:rainbow_active = 1
" doesn't work with CMake files for some reason
autocmd! BufEnter *.cmake RainbowToggleOff
autocmd! BufEnter CMakeLists.txt RainbowToggleOff

let mapleader = ' '

lua <<EOF
-- Telescope
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Misc settings
vim.opt.wildignorecase = true -- case-insensitive path completion
vim.opt.autoindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.hlsearch = true
--vim.opt.backspace = '2'
vim.opt.swapfile = false
vim.opt.hidden = true -- preserve history of hidden buffers
vim.opt.mouse = 'a'
EOF

" Persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" set guioptions-=L guioptions-=T guioptions-=m guioptions-=r guioptions-=b
" set guifont=Fira\ Code\ Regular:10
set noerrorbells visualbell t_vb=
filetype plugin indent on
let g:neovide_scale_factor=0.80
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
