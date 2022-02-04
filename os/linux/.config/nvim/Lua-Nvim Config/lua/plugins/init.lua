return require("packer").startup(function()
	--> Plugins
	use("wbthomason/packer.nvim")
	use("rcarriga/nvim-notify")

	--> Colorscheme
	use("ellisonleao/gruvbox.nvim")
	--> Status bar
	use("nvim-lualine/lualine.nvim")
    --> Tmux
    --use("benmills/vimux")
    use("christoomey/vim-tmux-navigator")

	--> NerdTree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	--> IDE
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")
	use("preservim/nerdcommenter")
	use("phaazon/hop.nvim")
	use({ "rrethy/vim-hexokinase", run = "make hexokinase" }) --css
	--use("norcalli/nvim-colorizer.lua")

	--> LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
    --use("jose-elias-alvarez/null-ls.nvim")

	--> CMP plugins
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind-nvim")
	use("rafamadriz/friendly-snippets") -- Snippets

	--> Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")

	--> Git
	use("lewis6991/gitsigns.nvim")

	--> FZF
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
		},
	})
end)
