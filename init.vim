" === Customizations ===

let mapleader=" "

" For Plugin
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" interface
syntax on
set number
set ruler
set wrap
set showcmd
set wildmenu
set scrolloff=5


" Search
set hlsearch
exec "nohlsearch"
set ignorecase
set incsearch 
set smartcase

" Tabs
set tabstop=4
set shiftwidth=4

" Misc.
set hidden
set updatetime=100
set shortmess+=c
set mouse=a



" === Navigation ===

" Basic Cursor Move
noremap n h
noremap e j
noremap i l
noremap u k
noremap U 5k
noremap E 5j

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

noremap k i
noremap K I
noremap l u

map s <nop>
map S :w<CR>
map Q :q<CR>


" === Split ===
map si :set splitright<CR>:vsplit<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map su :set nosvlitbelow<CR>:split<CR>
map se :set splitbelow<CR>:split<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" Cursor Move Between Split
map <LEADER>i <C-w>l
map <LEADER>u <C-w>k
map <LEADER>n <C-w>h
map <LEADER>e <C-w>j

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize +5<CR>
map <right> :vertical resize -5<CR>

" TAB
map tu :tabe<CR>
map tn :-tabnext<CR>
map ti :+tabnext<CR>

" Misc.
map R :source $MYVIMRC<CR>
