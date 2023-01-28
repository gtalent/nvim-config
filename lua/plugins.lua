require('ensure_packer')
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'ARM9/arm-syntax-vim'
	use 'PProvost/vim-ps1'
	use 'Tetralux/odin.vim'
	use 'airblade/vim-gitgutter'
	use 'altercation/vim-colors-solarized'
	use 'blerins/flattown'
	use 'ctrlpvim/ctrlp.vim'
	use 'fatih/vim-go'
	use 'gilgigilgil/anderson.vim'
	use 'hashivim/vim-terraform'
	use 'joshdick/onedark.vim'
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'
	use 'leafgarland/typescript-vim'
	use 'liuchengxu/vista.vim'
	use 'luochen1990/rainbow'
	use 'martinda/Jenkinsfile-vim-syntax'
	use 'mbbill/undotree'
	use 'mfussenegger/nvim-dap'
	use 'neovim/nvim-lspconfig'
	-- use {
	-- 	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- 	requires = { {'nvim-lua/plenary.nvim'} }
	-- }
	use 'nvim-treesitter/nvim-treesitter'
	use 'peterhoeg/vim-qml'
	use 'reedes/vim-wordy'
	use 'scrooloose/nerdtree'
	use 'skammer/vim-css-color'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-git'
	use 'tpope/vim-obsession'
	use 'tree-sitter/tree-sitter-cpp'
	use 'vim-airline/vim-airline'
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	-- vsnip
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
end)
