if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" key mappings
nnoremap <SPACE> <Nop>
let mapleader = ' '
nmap <leader>n :Lexplore<CR>
" switch windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h
tmap <C-J> <C-W>j
tmap <C-K> <C-W>k
tmap <C-L> <C-W>l
tmap <C-H> <C-W>h
" vertical / horizontal split window
nmap <leader>vs :vs<space>
nmap <leader>hs :split<space>
" terminal in split window
nmap <leader>vt :vert term ++close<cr>
nmap <leader>ht :term ++close<cr>
tmap <leader>vt <c-w>:vert term ++close<cr>
tmap <leader>ht <c-w>:term ++close<cr>
" resize window
" vertical/horizontal 'i'ncrease / 'd'ecrease
nmap <leader>vi :vertical resize +5<cr>
nmap <leader>vd :vertical resize -5<cr>
nmap <leader>hi :resize +5<cr>
nmap <leader>hd :resize -5<cr>
tmap <leader>vi <c-w>:vertical resize +5<cr>
tmap <leader>vd <c-w>:vertical resize -5<cr>
tmap <leader>hi <c-w>:resize +5<cr>
tmap <leader>hd <c-w>:resize -5<cr>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#lsp#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#netrw#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#gitgutter#enabled = 1
" let g:airline#extensions#term#enabled = 0
let g:airline_theme='gruvbox'
" let g:airline_powerline_fonts = 1
let g:airline_section_z = ''
" let g:airline_section_z = '%{strftime("%H:%M")}'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.dirty='!'
let g:airline_symbols.maxlinenr=''
" let g:airline_symbols.linenr=''
let g:airline_symbols.whitespace=''
let g:airline_symbols.branch=''

Plug 'tpope/vim-eunuch'
" CTRL+X /, SPACE, ENTER
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Switch single lines
nmap <S-k> [e
nmap <S-j> ]e
" Switch multiple lines
vmap <S-k> [egv
vmap <S-j> ]egv
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :Rg<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>
" Plug 'stsewd/fzf-checkout.vim'
" nnoremap <leader>gc :GCheckout<CR>
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" git status
nmap <leader>gs :G<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
"nnoremap <silVent> <leader>gs :Gstatus<cr>
"nnoremap <silent> <leader>gc :Gcommit<cr>
"nnoremap <silent> <leader>gw :Gwrite<cr>
"nnoremap <silent> <leader>gd :Gvdiff<cr>
"nnoremap <leader>ge :Gedit<cr>
"nnoremap <silent><leader>gb :Gblame<cr>
Plug 'prabirshrestha/vim-lsp'
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': '>>'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
let g:lsp_diagnostics_signs_hint = {'text': '?!'}
" show messages
let g:lsp_diagnostics_echo_cursor = 1
" disable automatic signature hover
let g:lsp_signature_help_enabled = 1
let g:lsp_format_sync_timeout = 1000
let g:lsp_highlight_references_enabled = 1
let g:lsp_document_highlight_enabled = 1
" format on save
let g:lsp_format_sync_timeout = 1000
autocmd! BufWritePre *.rs,*.dart call execute('LspDocumentFormatSync')
" key mappings
nmap <leader>ld <plug>(lsp-definition)
nmap <leader>lref <plug>(lsp-references)
nmap <leader>lr <plug>(lsp-rename)
nmap <leader>lh <plug>(lsp-hover)
nmap <leader>la <plug>(lsp-code-action)
nmap <leader>lf <plug>(lsp-document-format)
nmap <leader>ln <plug>(lsp-next-diagnostic)
nmap <leader>lp <plug>(lsp-previous-diagnostic)
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
Plug 'mattn/vim-lsp-settings'
let g:lsp_settings_root_markers = ['.git/']
Plug 'prabirshrestha/asyncomplete.vim'
" imap <c-space> <Plug>(asyncomplete_force_refresh)
" let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['markdown']
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'untitled-ai/jupyter_ascending.vim'
"   let g:jupyter_ascending_auto_write = 1
"   nmap <leader>x <Plug>JupyterExecute
"   nmap <leader>X <Plug>JupyterExecuteAll
" coloscheme
Plug 'gruvbox-community/gruvbox'
call plug#end()

set path+=**
set wildmenu
set ttyfast
set encoding=utf-8
set laststatus=2
set nowrap
set noshowmode
set noshowcmd
set timeout
set ttimeout
set timeoutlen=250
" set ttimeoutlen=50
set number
set smartindent
" Autoindent when starting new line, or using `o` or `O`.
set autoindent
" Allow backspace in insert mode.
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set shiftround
set smarttab
set expandtab
set cursorline
" show one more line while scolling
set scrolloff=8
set sidescrolloff=5
set display+=lastline
" Always focus on splited window.
set splitright
set splitbelow
" true color support
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Ignore case when searching.
set ignorecase
" Incremental search
set incsearch
set shell=/usr/bin/zsh
" hide intro message
set shortmess=I
set background=dark
colorscheme gruvbox
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set hidden
" use line number column also for signs
set signcolumn=yes
" customize builtin file tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_localrmdir='rm -rf'
" disable mouse
if !has('nvim')
  set ttymouse=
  set mouse=
endif
" disable arrow keys
noremap <Up> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Down> <Nop>
noremap <Left> <Nop>
inoremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Right> <Nop>
