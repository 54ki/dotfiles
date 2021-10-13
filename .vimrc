" Keybind for paste mode
set pastetoggle=<F2>

" changes the cursor based on normal/insert mode
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"

" always show the status line
set laststatus=2
" status line with buffer number, file name, row and column numbers as well as percentage through file
set statusline+=[%n]%<%F\ %m%r%h%w%=%-14.(%l/%L,%c%V%)\ %P

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Enable autocompletion:
set wildmode=longest,list,full

" Splits open at the bottom and right
set splitbelow splitright

" Change color of highlights
hi Visual cterm=bold ctermbg=8 ctermfg=None

" Change color of highlights when using vimdiff
if &diff
	colorscheme industry
endif
