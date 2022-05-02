local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
  use 'lewis6991/impatient.nvim'

	--> Colorscheme
  use "ellisonleao/gruvbox.nvim"
  --use "rebelot/kanagawa.nvim" --italic
  use "OSITO326/nightfox.nvim"
	--> Status bar
	use "nvim-lualine/lualine.nvim"

	--> NerdTree
	use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

	--> FZF
	use "nvim-telescope/telescope.nvim"
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	--> Git
	use "lewis6991/gitsigns.nvim"

	--> IDE
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "lukas-reineke/indent-blankline.nvim"
  --use "yggdroot/indentline" --vim
  use "akinsho/toggleterm.nvim"
  --use "christoomey/vim-tmux-navigator" -- tmux navigator
  use "preservim/nerdcommenter"
  use "phaazon/hop.nvim"
  use "norcalli/nvim-colorizer.lua" -- css
  use { "rrethy/vim-hexokinase", run = "make hexokinase" } --css

	--> CMP plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	--> Snippets
	use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use { "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" }
  use "onsails/lspkind-nvim"
  use "quangnguyen30192/cmp-nvim-ultisnips"

	--> LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  --> Laravel
  use "tpope/vim-dispatch"
  use "tpope/vim-projectionist"
  use "noahfrederick/vim-composer"
  use "noahfrederick/vim-laravel"
  use "jwalton512/vim-blade" -- blade files
  --> Flutter
  use "akinsho/flutter-tools.nvim"
  use "mfussenegger/nvim-dap"

  --> Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use "nvim-treesitter/nvim-treesitter-refactor"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
