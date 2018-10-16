

" Cancel compatibility with Vi
set nocompatible

" Activate pathogen
call pathogen#infect()


" -- Display
set title		" Update title of window in term
set number		" Display line numbers
set ruler		" Display cursor position
set showmatch		" Show matching parens, brackets, etc
set wrap		" Wrap lines when they are too long

set scrolloff=3		" Display at least 3 lines around cursor


" -- Text management
filetype plugin indent on
" 2 space please
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" Round indent to nearest multiple of 2
set shiftround
" Spell-check always on
set spell

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

" Hide file instead of abandoning when switching to another buffer
set hidden

" Italicised comments and attributes
highlight Comment cterm=italic
highlight htmlARG cterm=italic

" Set relevant filetypes
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd FileType crontab setlocal nowritebackup
autocmd FileType crontab setlocal backupcopy=yes

" Don't offer to pen certain files/directories
set wildignore+=node_modules/*

syntax on


" -- Font
if has("gui_running")
  set macligatures
endif
set guifont=Fira\ Code:h14

set mouse=a

" Show the current mode
set showmode



" NERDTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>


" cronjob testing 7.10.'18
