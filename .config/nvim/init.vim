" Mats Pfeiffer <mats.pfeiffer@googlemail.com>
set nocompatible
syntax on
set nowrap
set encoding=utf8

"
" vim-plug
"
if (!isdirectory(expand("~/.config/nvim/plugged")))
  !curl -fLo ~/.config/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

function! InstallFonts(info)
  !git clone https://github.com/ryanoasis/nerd-fonts --depth 1
  !./nerd-fonts/install.sh DroidSansMono
  !rm -rf nerd-fonts
endfunction

function! InstallLSP(info)
  !bash install.sh
  !sudo npm install -g javascript-typescript-langserver vue-language-server
endfunction

" plugins
call plug#begin('~/.config/nvim/plugged')

" mappings
let mapleader = ","
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" coming back from terminal mode with ESC
tnoremap <Esc> <C-\><C-n>
"tnoremap <M-[> <Esc>
" send ESC to terminal command
tnoremap <C-v><Esc> <Esc>

" window switching btw. 'M' is meta key (ALT)
" Terminal mode:
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
" Visual mode:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
" Normal mode:
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

Plug 'vim-airline/vim-airline', { 'do': function('InstallFonts') }
Plug 'vim-airline/vim-airline-themes'
  let g:airline_powerline_fonts = 1
  "let g:airline_extensions = []
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_theme='base16'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
  nmap <silent> <leader>gs :Gstatus<cr>
  nmap <leader>ge :Gedit<cr>
  "nmap <silent><leader>gr :Gread<cr>
  nmap <silent><leader>gb :Gblame<cr>
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
Plug 'gko/vim-coloresque'
"Plug 'Yggdroot/indentLine'
Plug 'Shougo/context_filetype.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1
  map <Leader>n :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx', 'vue'] }
"Plug 'mhartington/nvim-typescript'
"Plug 'othree/html5.vim', { 'for': ['html'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'posva/vim-vue', { 'for': 'vue' }
  autocmd FileType vue syntax sync fromstart
  "let g:vue_disable_pre_processors = 1
"Plug 'Shougo/context_filetype.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': function('InstallLSP') } ", 'for': ['javascript', 'javascript.jsx', 'vue'] }
  let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'vue': ['vls'],
    \ 'html': ['vls'] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_start_length = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" dont forget to install ag --> pacman -S the_silver_searcher
Plug 'Shougo/denite.nvim'
  nnoremap <silent> <c-p> :Denite buffer file_rec<CR>
  nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
  nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
  nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
  nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"
Plug 'scrooloose/nerdcommenter'
Plug 'kassio/neoterm'
  nnoremap <silent> <f10> :TREPLSendFile<cr>
  nnoremap <silent> <f9> :TREPLSendLine<cr>
  vnoremap <silent> <f9> :TREPLSendSelection<cr>
  nnoremap <silent> ,th :call neoterm#close()<cr>
  nnoremap <silent> ,tl :call neoterm#clear()<cr>
  nnoremap <silent> ,tc :call neoterm#kill()<cr>
Plug 'ryanoasis/vim-devicons'
call plug#end()

" default config
set splitbelow
set splitright
set updatetime=250
set hidden
let s:hidden_all = 1
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set number
set autoindent
set scrolloff=3
set tabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
set cursorline
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set t_Co=256
set termguicolors
"set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono\ 11
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono\ 10
"set background=dark
let g:onedark_termcolors=16
colorscheme onedark

" denite
call denite#custom#option('_', {
  \ 'prompt': '❯',
  \ 'winheight': 10,
  \ 'updatetime': 1,
  \ 'auto_resize': 0,
  \ 'highlight_matched_char': 'Underlined',
  \ 'highlight_mode_normal': 'CursorLine',
  \ 'reversed': 1,
  \})
call denite#custom#var('file_rec', 'command',
   \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])
call denite#custom#map(
  \ 'insert',
  \ '<C-j>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)
call denite#custom#map(
  \ 'insert',
  \ '<C-k>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)
