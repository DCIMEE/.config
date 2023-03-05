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

" === Plugins ===
call plug#begin()

Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'

call plug#end()


" === Coc.Nvim ===
"
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-clangd', 'coc-texlab']

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <ctrl-o> to trigger completion
  inoremap <silent><expr> <c-o> coc#refresh()


" Use `SPACE-` and `SPACE=` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use SPACE+m to show documentation in preview window
nnoremap <silent> <LEADER>m :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
