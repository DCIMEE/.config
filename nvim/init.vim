" === Customizations ===

let mapleader=" "

" For Plugins
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" interface
syntax on
set number
set relativenumber
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
set nocompatible
set hidden
set updatetime=100
set shortmess+=c
set mouse=a
set autoindent


" === Navigation ===

" Basic Cursor Move
noremap n h
noremap e j
noremap i l
noremap u k
noremap U 5k
noremap E 5j


" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

noremap k i
noremap K I
noremap l u

map s <nop>
map S :w<CR>
map Q :q<CR>

" Copy to system clipboard
vnoremap Y "+y

" Edit init.vim
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>

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

" Split a terminal on the right side
map tm :set splitright<CR>:vsplit<CR>:term<CR>
tnoremap <Esc> <C-\><C-n><CR>

" Plugins
call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" == vim-visual-multi ==
let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'


" == wildfire ==
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }



" === coc.nvim ===
let g:coc_global_extensions = [
			\ 'coc-vimlsp', 
			\ 'coc-clangd', 
			\ 'coc-json',
			\ 'coc-actions', 
			\ 'coc-explorer']


" === Coc.Nvim Configurations

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


" Use <c-space> to trigger completion
inoremap <silent><expr> <c-o> coc#refresh()


" Use `<SPACE>-` and `<SPACE>=` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use <LEADER>h to show documentation in preview window
nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Shortcut to call coc-explorer
nmap tt :CocCommand explorer<CR>

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
