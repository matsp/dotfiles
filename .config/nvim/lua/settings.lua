local opt = vim.opt

opt.path = opt.path + '**'
opt.wildmenu = true
opt.ttyfast = true
opt.laststatus = 2
opt.wrap = false
opt.showmode = false
opt.showcmd = false
-- opt.timeout = true
-- opt.ttimeout = true
-- opt.timeoutlen = 250
opt.number = true
opt.relativenumber = true
opt.smartindent = true
opt.autoindent = true
opt.backspace = 'indent,eol,start'
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.smarttab = true
opt.expandtab = true
opt.cursorline = true

--set path+=**
--set wildmenu
--set ttyfast
--set encoding=utf-8
--set laststatus=2
--set nowrap
--set noshowmode
--set noshowcmd
--set timeout
--set ttimeout
--set timeoutlen=250
--" set ttimeoutlen=50
--set number
--set relativenumber
--set smartindent
--" Autoindent when starting new line, or using `o` or `O`.
--set autoindent
--" Allow backspace in insert mode.
--set backspace=indent,eol,start
--set tabstop=2
--set shiftwidth=2
--set shiftround
--set smarttab
--set expandtab
--set cursorline
opt.scrolloff = 8
opt.sidescrolloff = 5
opt.display = opt.display + 'lastline'
opt.splitright = true
opt.splitbelow = true
--" show one more line while scolling
--set scrolloff=8
--set sidescrolloff=5
--set display+=lastline
--" Always focus on splited window.
--set splitright
--set splitbelow
--" true color support
--" set termguicolors
--" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--" Ignore case when searching.
opt.ignorecase = true
opt.incsearch = true
opt.shell = '/usr/bin/zsh'
opt.shortmess = 'I'
opt.background = 'dark'
opt.termguicolors = true

--set ignorecase
--" Incremental search
--set incsearch
--set shell=/usr/bin/zsh
--" hide intro message
--set shortmess=I
--set background=dark
--" silent! colorscheme gruvbox
--
-- TODO: check later if needed
--set list
--set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
--set hidden
opt.signcolumn = 'yes'
opt.swapfile = false

--" use line number column also for signs
--set signcolumn=yes
--" disable mouse
--if !has('nvim')
--set ttymouse=
--set mouse=
--endif
-- TODO: check later
--" filetype
--au BufRead,BufNewFile *.njk set filetype=html

-- auto-session recommend
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
