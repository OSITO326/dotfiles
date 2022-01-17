return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig' 
	use 'williamboman/nvim-lsp-installer'
	use "onsails/lspkind-nvim"
	use 'L3MON4D3/LuaSnip'
	use 'nvim-lualine/lualine.nvim'

	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
end)
