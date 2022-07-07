" Autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" key mappings
nnoremap <SPACE> <Nop>
let mapleader = " "
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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'folke/trouble.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

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
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
""let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore-vcs --hidden'
"let $FZF_DEFAULT_COMMAND = 'rg --files'
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
"nnoremap <leader>f :Files<CR>
"nnoremap <leader>gf :Rg<CR>
"nnoremap <leader>c :Commits<CR>
"nnoremap <leader>b :Buffers<CR>
"nnoremap <leader>w :Windows<CR>
" Plug 'stsewd/fzf-checkout.vim'
  " nnoremap <leader>gc :GCheckout<CR>
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" git status
nmap <leader>gs :G<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

" Plug 'prabirshrestha/vim-lsp'
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_signs_error = {'text': '>>'}
" let g:lsp_diagnostics_signs_warning = {'text': '‼'}
" let g:lsp_diagnostics_signs_hint = {'text': '?!'}
" " show messages
" let g:lsp_diagnostics_echo_cursor = 1
" " disable automatic signature hover
" let g:lsp_signature_help_enabled = 1
" let g:lsp_format_sync_timeout = 1000
" let g:lsp_highlight_references_enabled = 1
" let g:lsp_document_highlight_enabled = 1
" " format on save
" let g:lsp_format_sync_timeout = 1000
" autocmd! BufWritePre *.rs,*.dart call execute('LspDocumentFormatSync')
" " key mappings
" nmap <leader>ld <plug>(lsp-definition)
" nmap <leader>lref <plug>(lsp-references)
" nmap <leader>lr <plug>(lsp-rename)
" nmap <leader>lh <plug>(lsp-hover)
" nmap <leader>la <plug>(lsp-code-action)
" nmap <leader>lf <plug>(lsp-document-format)
" nmap <leader>ln <plug>(lsp-next-diagnostic)
" nmap <leader>lp <plug>(lsp-previous-diagnostic)
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" Plug 'mattn/vim-lsp-settings'
" let g:lsp_settings_root_markers = ['.git/']
" Plug 'prabirshrestha/asyncomplete.vim'
" imap <c-space> <Plug>(asyncomplete_force_refresh)
" let g:asyncomplete_auto_popup = 0

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ asyncomplete#force_refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tpope/vim-commentary'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'folke/todo-comments.nvim'

call plug#end()

lua <<EOF

-- treesitter
require'nvim-treesitter.configs'.setup { ensure_installed = { "go", "lua", "dart", "html", "json", "markdown", "scss" }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

-- colorscheme
vim.g.tokyonight_style = "storm"
vim.cmd[[colorscheme tokyonight]]

-- telescope
require('telescope').setup()
local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
-- map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)

-- todo-comments
require("todo-comments").setup {}

-- lsp-trouble
--require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  -- }

-- lualine
require('lualine').setup {
  options = {
    theme = 'tokyonight',
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}

-- indentline
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

require("nvim-lsp-installer").setup {
  automatic_installation = true
}

-- lspconfig
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lsp = {
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
    diagnostic = {
      -- virtual_text = true,
      virtual_text = { spacing = 4, prefix = "●" },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
      },
    },
  }

-- Diagnostic configuration
vim.diagnostic.config(lsp.diagnostic)

-- Hover configuration
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)
-- Signature help configuration
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>gn', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'dartls', 'gopls', 'jsonls', 'html', 'marksman', 'yamlls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        -- Source
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          luasnip = "[Snip]",
          nvim_lua = "[Lua]",
          treesitter = "[Treesitter]",
          path = "[Path]",
          nvim_lsp_signature_help = "[Signature]",
        })[entry.source.name]
        return vim_item
      end,
  }
}

EOF

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
" set termguicolors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Ignore case when searching.
set ignorecase
" Incremental search
set incsearch
set shell=/usr/bin/zsh
" hide intro message
set shortmess=I
set background=dark
" silent! colorscheme gruvbox
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
