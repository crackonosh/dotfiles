" Cancel compatibility with Vi
set nocompatible

" Activate pathogen
call pathogen#infect()

syntax on 
colorscheme Inanis

" -- Display
set title		" Update title of window in term
set number		" Display line numbers
set ruler		" Display cursor position
set showmatch		" Show matching brackets, etc
set wrap		" Wrap lines when they are too long
set scrolloff=3		" Display at least 3 lines around cursor


" -- Text management
filetype plugin indent on
" 2 space please
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround " Round indent to nearest multiple of 2


" -- Search
set ignorecase		" Ignore case when searching
set smartcase		" If upperCase in search term, do case sensitive
set incsearch		" Highlight search results when typing
set hlsearch		" Highlight search results


" -- Beep
set visualbell		" Prevent Vim from beeping
set noerrorbells	" Prevent Vim from beeping


" Backspace behaves as expected
set backspace=indent,eol,start


" Italicised comments and attributes
highlight Comment cterm=italic
highlight htmlARG cterm=italic


" Set relevant filetypes
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd FileType crontab setlocal nowritebackup
autocmd FileType crontab setlocal backupcopy=yes " Don't offer to pen certain files/directories
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.php set filetype=php


" ignore certain files and/or directories
set wildignore+=node_modules/*


" -- Font
if has("gui_running")
  set macligatures
endif


" NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Quicker window movement in NERDTree
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Indent-Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guide_size = 2

" -- Movement
" move to beginning/end of line
nnoremap B ^
nnoremap E $


" OTHER
set noswapfile
set autowrite   " :write before command
set hidden " Hide file instead of abandoning when switching to another buffer
set showmode " Show the current mode
set mouse=a " allows to use mouse


let g:AutoClosePreserveDotReg = 0
