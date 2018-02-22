" Mats Pfeiffer <mats.pfeiffer@googlemail.com>

" vim-plug
if (!isdirectory(expand("~/.config/nvim/plugged")))
  !curl -fLo ~/.config/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

function! InstallFonts(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !git clone https://github.com/ryanoasis/nerd-fonts --depth 1
    !./nerd-fonts/install.sh DroidSansMono
    !rm -rf nerd-fonts
  endif
endfunction

function! InstallLSP(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
    !sudo npm install -g
      \ javascript-typescript-langserver
      \ flow-language-server
      \ vue-language-server
      \ vscode-css-languageserver-bin
      \ vscode-html-languageserver-bin
      \ vscode-json-languageserver-bin
      \ dockerfile-language-server-nodejs
  endif
  !sudo npm update -g 
    \ javascript-typescript-langserver
    \ flow-language-server
    \ vue-language-server
    \ vscode-css-languageserver-bin
    \ vscode-html-languageserver-bin
    \ vscode-json-languageserver-bin
    \ dockerfile-language-server-nodejs
endfunction

" plugins
call plug#begin('~/.config/nvim/plugged')

" mappings
let mapleader = ","
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" coming back from terminal mode with ESC
tnoremap <Esc> <C-\><C-n>
"tnoremap <M-[> <Esc>
" send ESC to terminal command
tnoremap <C-v><Esc> <Esc>
" open terminal
"nnoremap <Leader>t :70VTerm<CR>

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
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_theme='base16'
  "let g:airline_theme='solarized'
" themes
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-fugitive'
  nmap <silent> <leader>gs :Gstatus<cr>
  nmap <silent> <leader>gc :Gcommit<cr>
  nmap <silent> <leader>ga :Gwrite<cr>
  nmap <leader>ge :Gedit<cr>
  nmap <silent><leader>gb :Gblame<cr>
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
Plug 'gko/vim-coloresque'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1
  map <Leader>n :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'vue'] }
"Plug 'othree/yajs.vim', { 'for': ['javascript', 'vue'] }
"Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', vue'] }
Plug 'moll/vim-node', { 'for': ['javascript'] }
Plug 'othree/html5.vim', { 'for': ['html', 'vue'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'posva/vim-vue', { 'for': 'vue' }
  autocmd FileType vue syntax sync fromstart
  let g:vue_disable_pre_processors = 1
Plug 'ekalinin/dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  "let g:deoplete#auto_complete_start_length = 1
  let g:deoplete#keyword_patterns = {}
  let g:deoplete#keyword_patterns._ = '[a-zA-Z_$]\w*'
  "let g:deoplete#ignore_sources = {}
  "let g:deoplete#ignore_sources._ = 'buffer'
  let g:deoplete#max_list = 1000
  set completeopt-=preview
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  "inoremap <expr><cr> pumvisible() ? "\<c-y>" : "\<cr><cr>"
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': function('InstallLSP') }
  let g:LanguageClient_serverCommands = { 
    \ 'vue': ['vls'],   
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'scss': ['css-languageserver', '--stdio'],
    \ 'less': ['css-languageserver', '--stdio'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'Dockerfile': ['docker-langserver', '--stdio']
    \ }
    " \ 'javascript': ['flow-language-server', '--stdio'],

  augroup LanguageClient_config                                                                                                                                           
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto 
  augroup END
  nnoremap <silent> <Leader>lh :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> <Leader>ld :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <Leader>lr :call LanguageClient_textDocument_rename()<CR>
  nnoremap <silent> <Leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <silent> <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
  vnoremap <silent> <Leader>lf :call LanguageClient_textDocument_rangeFormatting()<CR>
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" dont forget to install ag --> pacman -S the_silver_searcher
Plug 'Shougo/denite.nvim'
  nnoremap <silent> <c-p> :Denite buffer file_rec<CR>
  nnoremap <silent> <c-g> :Denite grep<CR>
  " common buffer tasks
  nnoremap <silent> <Leader>bb :bn<CR> "create (N)ew buffer
  nnoremap <silent> <Leader>bd :bdelete<CR> "(D)elete the current buffer
  nnoremap <silent> <Leader>bu :bunload<CR> "(U)nload the current buffer
  nnoremap <silent> <Leader>bl :setnomodifiable<CR> " (L)ock the current buffer"
Plug 'scrooloose/nerdcommenter'
  let g:ft = ''
  fu! NERDCommenter_before()
        if &ft == 'vue'
            let g:ft = 'vue'
            let stack = synstack(line('.'), col('.'))
            if len(stack) > 0
                let syn = synIDattr((stack)[0], 'name')
                if len(syn) > 0
                    let syn = tolower(syn)
                    exe 'setf '.syn
                endif
            endif
        endif
  endfu
  fu! NERDCommenter_after()
        if g:ft == 'vue'
            setf vue
            let g:ft = ''
        endif
  endfu
Plug 'neomake/neomake'
  "let g:neomake_open_list = 2
Plug 'benjie/neomake-local-eslint.vim'
"Plug 'kassio/neoterm'
"Plug 'vimlab/split-term.vim'
  "nnoremap <silent> <f10> :TREPLSendFile<cr>
  "nnoremap <silent> <f9> :TREPLSendLine<cr>
  "vnoremap <silent> <f9> :TREPLSendSelection<cr>
  "nnoremap <silent> ,th :call neoterm#close()<cr>
  "nnoremap <silent> ,tl :call neoterm#clear()<cr>
  "nnoremap <silent> ,tc :call neoterm#kill()<cr>
Plug 'ryanoasis/vim-devicons'
call plug#end()

" default config
"set nocompatible
filetype plugin on
syntax on
set nowrap
set encoding=utf8
set nobackup
set nowb
set noswapfile
set splitbelow
set splitright
set updatetime=100
set hidden
set shortmess+=c
set noshowmode
set noshowcmd
set number
set autoindent
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
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono\ 10
set background=dark
colorscheme onedark
"colorscheme solarized8

" deoplete
call deoplete#custom#source('_', 'min_pattern_length', 1)

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
   \ ['ag', '--follow', '--nocolor', '--nogroup', '--ignore', 'node_modules', '-g', ''])
"call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
"call denite#custom#source('file_rec', 'matchers', ['matcher_cpsm'])

call denite#custom#var('grep', 'command', ['ag'])
"call denite#custom#var('grep', 'default_opts',
    "\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
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

" neomake
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 500ms).
call neomake#configure#automake('nw', 500)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)
