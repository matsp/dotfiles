if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" key mappings
let mapleader = ','

nmap <leader>n :Lexplore<CR>
nmap <leader>b :buffers<CR>:b<space>
" close buffer
nmap <leader>bd :bd<cr>
" open buffers by number
nmap <leader>1 :b<space>1<CR>
nmap <leader>2 :b<space>2<CR>
nmap <leader>3 :b<space>3<CR>
nmap <leader>4 :b<space>4<CR>
nmap <leader>5 :b<space>5<CR>
nmap <leader>6 :b<space>6<CR>
nmap <leader>7 :b<space>7<CR>
nmap <leader>8 :b<space>8<CR>
nmap <leader>9 :b<space>9<CR>
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
  let g:airline#extensions#gitgutter#enabled = 1
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
  if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
  else
    let g:ctrlp_clear_cache_on_exit = 0
  endif

Plug 'airblade/vim-gitgutter'
  let g:gitgutter_set_sign_backgrounds = 1

Plug 'tpope/vim-fugitive'
  "nnoremap <silent> <leader>gs :Gstatus<cr>
  "nnoremap <silent> <leader>gc :Gcommit<cr>
  "nnoremap <silent> <leader>gw :Gwrite<cr>
  "nnoremap <silent> <leader>gd :Gvdiff<cr>
  "nnoremap <leader>ge :Gedit<cr>
  "nnoremap <silent><leader>gb :Gblame<cr>

Plug 'prabirshrestha/vim-lsp'
  let g:lsp_signs_enabled = 1
  let g:lsp_signs_error = {'text': '>>'}
  let g:lsp_signs_warning = {'text': '--'}
  let g:lsp_signs_hint = {'text': '--'}
  " show messages
  let g:lsp_diagnostics_echo_cursor = 1
  " disable automatic signature hover
  let g:lsp_signature_help_enabled = 0
  let g:lsp_format_sync_timeout = 1000
  let g:lsp_highlight_references_enabled = 1
  autocmd! BufWritePre *.dart,*.js call execute('LspDocumentFormatSync')
  " key mappings
  nmap gd <plug>(lsp-definition)
  nmap gref <plug>(lsp-references)
  nmap gr <plug>(lsp-rename)
  nmap gh <plug>(lsp-hover)
  nmap ga <plug>(lsp-code-action)
  nmap gf <plug>(lsp-document-format)
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'tpope/vim-commentary'
  autocmd FileType dart setlocal commentstring=/\/\ %s

Plug 'sheerun/vim-polyglot'

" Flutter
Plug 'thosakwe/vim-flutter'
  let g:flutter_show_log_on_run = 0

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
" fix signcolumn background with solarized scheme
autocmd ColorScheme * highlight! link SignColumn LineNr
set background=dark
silent! colorscheme solarized
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set hidden
" use line number column also for signs
set signcolumn=number
" customize builtin file tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
