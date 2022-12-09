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
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "lewis6991/impatient.nvim" })

	--> Colorscheme
	use({ "themercorp/themer.lua" }) -- Themes management
	--> Status bar
	use({ "nvim-lualine/lualine.nvim" })
	--> IDE
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "lukas-reineke/indent-blankline.nvim" })
	--use "romgrk/barbar.nvim" -- Bar tabs
	use({ "akinsho/toggleterm.nvim" })
	--use "christoomey/vim-tmux-navigator" -- tmux navigator
	use({ "folke/which-key.nvim" }) -- Keybindings
	use({ "ThePrimeagen/harpoon" }) -- Harpoon
	use({ "preservim/nerdcommenter" })
	use({ "phaazon/hop.nvim" })
	use({ "norcalli/nvim-colorizer.lua" }) -- css

	-- Markdown
	--use { "davidgranstrom/nvim-markdown-preview", commit = "3d6f941beb223b23122973d077522e9e2ee33068"} -- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	--> Surround
	use({ "kylechui/nvim-surround", commit="030a4373aea4354d28052108650bf4e916d3283a" }) -- Surround
	--> NerdTreeLua
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	--> Git --all -pt
	use({ "lewis6991/gitsigns.nvim" })
	use({ "tpope/vim-fugitive" })
	use({ "rcarriga/nvim-notify" })

	--> FZF
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
			{ "nvim-lua/popup.nvim" }, -- An implementation of the Popup API from vim in Neovim
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
			{ "nvim-telescope/telescope-hop.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
		},
	})

	--> CMP plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	--> Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" })
	use({ "onsails/lspkind-nvim" })
	--use "quangnguyen30192/cmp-nvim-ultisnips"

	--> LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  use({ "glepnir/lspsaga.nvim", branch = "main" })
	use({ "RRethy/vim-illuminate" })

	--> Laravel
	--use "tpope/vim-dispatch"
	--use "tpope/vim-projectionist"
	--use "noahfrederick/vim-composer"
	--use "noahfrederick/vim-laravel"
	--use "jwalton512/vim-blade" -- blade files
	--> Flutter
	use({ "akinsho/flutter-tools.nvim" })

	--> Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-refactor" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-ts-autotag" }) -- closetag

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
