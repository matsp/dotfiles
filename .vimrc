if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdtree'
map <C-f> :NERDTreeToggle<CR>

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

Plug 'altercation/vim-colors-solarized'

call plug#end()

set number
set smartindent
let mapleader = ','
syntax enable
set background=dark
colorscheme solarized
