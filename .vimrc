if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  "let g:airline#extensions#ale#enabled = 1
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='dark'
  let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.dirty='*'
  let g:airline#extensions#lsp#enabled = 1

Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
  nmap <silent> <leader>gs :Gstatus<cr>
  nmap <silent> <leader>gc :Gcommit<cr>
  nmap <silent> <leader>gw :Gwrite<cr>
  nmap <silent> <leader>gd :Gvdiff<cr>
  nmap <leader>ge :Gedit<cr>
  nmap <silent><leader>gb :Gblame<cr>

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
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Plug 'dense-analysis/ale'
  "let g:ale_completion_autoimport = 1
  "let g:ale_completion_enabled = 1
  "let g:ale_fix_on_save = 1
  "let g:ale_lint_on_enter = 0
"  let g:ale_fixers = {
"    \ 'dart': ['analysis_server']
"    \}
"  let g:ale_linters = {
"    \ 'dart': ['analysis_server']
"    \}


Plug 'sheerun/vim-polyglot'
" already include in polygot
"Plug 'dart-lang/dart-vim-plugin'

"Plug 'tpope/vim-markdown', { 'for': 'markdown' }

call plug#end()




filetype plugin on
set ttyfast
" fuzzy search
"set path+=**
"set wildmenu
set encoding=utf-8
set laststatus=2
set nowrap
set noshowmode
set noshowcmd
set shortmess+=c
set ttimeoutlen=50
set number
set smartindent
let mapleader = ','
syntax enable
set background=dark
silent! colorscheme solarized
set autoindent
set tabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
set cursorline
set t_Co=256
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set hidden

let g:netrw_banner = 0
let g:netrw_liststyle = 3
nnoremap <leader>n :Lexplore<CR>
