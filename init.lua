require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'joshdick/onedark.vim'
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
end)
require('lsp')

vim.cmd [[
colorscheme onedark
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set splitright
]]

local map = vim.api.nvim_set_keymap
local options = { noremap = true }
vim.g.mapleader = " "
map("i", "jj", "<Esc>", options)
