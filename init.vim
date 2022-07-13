call plug#begin()
  Plug 'joshdick/onedark.vim'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme onedark

set autoindent
set expandtab
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

set splitright

inoremap jj <Esc> 

lua << EOF
require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")
lspconfig.tsserver.setup {}
EOF
