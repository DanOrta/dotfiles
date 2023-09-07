filetype on                 " Enable file type detection
filetype plugin on
set nocompatible
syntax on                   " Enable syntax highlighting
filetype indent on          " Enable filetype-specific indenting
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent              " smartindent wasn't so smart after all
set autoread                " Enable auto-read files
set clipboard=unnamedplus
set guioptions=aAace        " Don't show scrollbar
set hlsearch
set incsearch               " Set incremental search
set mouse=a
set number relativenumber   " Show line numbers and make them relative
set pastetoggle=<F12>       " With F12 you can toogle between allowing (or not) to paste from the clipboard
set scrolloff=5             " Show at least 5 lines above/below
set shiftwidth=4
set showmatch               " Show matching braces
set showmode                " Show INSERT, VISUAL, etc, mode
set smarttab                " Better space and tab functionality
set tabstop=4               " Make the tab indent equal to 4
set wildmenu
set wildmode=list:longest
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open and close all types of "parenthesis/braces/etc..."
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ¿ ¿?<Left>
inoremap ¡ ¡!<Left>

" LaTeX commands
autocmd FileType tex map <c-m> :wa<CR>:make<CR>

" Map Ctrl+S to save all files
map <c-s> <Esc>:wa<CR>
" Map Ctrl+S in insert mode to save a file
inoremap <c-s> <Esc>:w<CR>
" Map Ctrl+Z 
map <c-z> u
" Map Ctrl+Z in insert mode
inoremap <c-z> <Esc>ui<Right>
" Close without saving
map <Esc><Esc> :qa!<Enter>
" Go to he beginning of the document
map <Home><Home> <c-Home>
" Go to the end of the file
map <End><End> GA
" Go to the end of the file and add a new line
map <End>+ <c-End>o

" Tabs:
" Add a new tab
map ++ :tabnew<CR>
" Close tab without saving
map -- :q!<Enter>
" Move to the tab to the right
map <c-Right> gt
" Move to the tab to the left
map <c-Left> gT
" Open the terminal in a tab at the bottom
map tt :bo term<CR>

" C PROGRAMMING LANGUAGE
" Single-line C comment
inoremap // //<Space>
" Multi-line C comment
inoremap /*  /*<Space><Space><Space>*/<Left><Left><Left><Left>

" Move the screen using the cursor
map <ScrollWheelDown> <c-E>
map <ScrollWheelUp> <c-Y>
