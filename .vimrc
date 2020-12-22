if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
map <C-f> :NERDTreeToggle<CR>
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline#extensions#ale#enabled = 1
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='dark'
  let g:airline_powerline_fonts = 1

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

Plug 'dense-analysis/ale'
  let g:ale_completion_enabled=1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
    \ 'dart': ['analysis_server']
    \}
  let g:ale_linters = {
    \ 'dart': ['analysis_server']
    \}

Plug 'sheerun/vim-polyglot'
" already include in polygot
"Plug 'dart-lang/dart-vim-plugin'

Plug 'tpope/vim-markdown', { 'for': 'markdown' }

call plug#end()

filetype plugin on
set omnifunc=ale#completion#OmniFunc
set encoding=utf8
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
