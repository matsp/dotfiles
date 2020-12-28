if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" key mappings
let mapleader = ','

nmap <leader>n :Lexplore<CR>
nmap <leader>b :buffers<cr>:b<space>
" close buffer
nmap <leader>bd :bd<cr>
" open buffers by number
nmap <leader>1 :b<space>1<cr>
nmap <leader>2 :b<space>2<cr>
nmap <leader>3 :b<space>3<cr>
nmap <leader>4 :b<space>4<cr>
nmap <leader>5 :b<space>5<cr>
nmap <leader>6 :b<space>6<cr>
nmap <leader>7 :b<space>7<cr>
nmap <leader>8 :b<space>8<cr>
nmap <leader>9 :b<space>9<cr>
" switch windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h
" vertical / horizontal split window
nmap <leader>vs :vs<space>
nmap <leader>hs :split<space>


call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#lsp#enabled = 1
  let g:airline#extensions#fugitiveline#enabled = 1
  let g:airline#extensions#netrw#enabled = 1
  let g:airline#extensions#ctrlp#enabled = 1
  "let g:airline#extensions#ale#enabled = 1
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='dark'
  let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.dirty='*'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv

Plug 'ctrlpvim/ctrlp.vim'
  "let g:ctrlp_map = '<c-p>'
  nmap <leader>p :CtrlPMixed<cr>
  if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
  else
    let g:ctrlp_clear_cache_on_exit = 0
  endif

"Plug 'tpope/vim-fugitive'
  "nmap <silent> <leader>gs :Gstatus<cr>
  "nmap <silent> <leader>gc :Gcommit<cr>
  "nmap <silent> <leader>gw :Gwrite<cr>
  "nmap <silent> <leader>gd :Gvdiff<cr>
  "nmap <leader>ge :Gedit<cr>
  "nmap <silent><leader>gb :Gblame<cr>

Plug 'prabirshrestha/vim-lsp'
  let g:lsp_signs_enabled = 1
  let g:lsp_signs_error = {'text': '>>'}
  let g:lsp_signs_warning = {'text': '--'}
  let g:lsp_signs_hint = {'text': '--'}
  set signcolumn=number
  " show messages
  let g:lsp_diagnostics_echo_cursor = 1
  " disable automatic signature hover
  let  g:lsp_signature_help_enabled = 0
  " key mappings
    nmap <buffer> <leader>def <plug>(lsp-definition)
    nmap <buffer> <leader>ref <plug>(lsp-references)
    "nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> <leader>type <plug>(lsp-type-definition)
    nmap <buffer> <leader>r <plug>(lsp-rename)
    "nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    "nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>i <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.dart,*.js call execute('LspDocumentFormatSync')

Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()

" plain vim settings
set path+=**
set wildmenu
set ttyfast
set encoding=utf-8
set laststatus=2
set nowrap
set noshowmode
set noshowcmd
set shortmess+=c
set ttimeoutlen=50
set number
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
set cursorline
set t_Co=256
set background=dark
silent! colorscheme solarized
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set hidden

let g:netrw_banner = 0
let g:netrw_liststyle = 3
