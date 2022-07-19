call plug#begin()
  Plug 'joshdick/onedark.vim'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'neovim/nvim-lspconfig'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'windwp/nvim-autopairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

set autoindent
set expandtab
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

set splitright

set completeopt="-preview"

inoremap jj <Esc> 
nnoremap <space>K :lua vim.lsp.buf.code_action()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>

lua << EOF
local on_attach = function(_, buffer)
  vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

local setup_denols = function()
  vim.g.markdown_fenced_languages = {
    "ts=typescript"
  }
  lspconfig.denols.setup {
    on_attach = on_attach
  }
end

local setup_tsserver = function()
  lspconfig.tsserver.setup {
    on_attach = on_attach
  }
end

setup_tsserver()
EOF

lua << EOF
require("nvim-autopairs").setup {}
EOF
