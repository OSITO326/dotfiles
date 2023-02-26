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
	use({ "rcarriga/nvim-notify" })

	--> IDE
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua", commit = "e14989c0eaa6f9c299d48f7e45ce1ed04b21180f" })
	use({ "tpope/vim-dotenv" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-refactor" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-ts-autotag" }) -- closetag
	use({ "theprimeagen/harpoon" })
	use({ "windwp/nvim-autopairs" })
	use({ "mbbill/undotree" })
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "preservim/nerdcommenter" })
	use({ "phaazon/hop.nvim" })
	use({ "norcalli/nvim-colorizer.lua" }) -- css
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "kylechui/nvim-surround" })
	use({ "akinsho/flutter-tools.nvim" }) -- Flutter
	use({ "folke/which-key.nvim" }) -- Keybindings
	use({ "folke/zen-mode.nvim" })
	use({ "ray-x/lsp_signature.nvim" }) -- lsp_signature
	use({ "onsails/diaglist.nvim" }) -- diagnostics
	use({ "Tastyep/structlog.nvim" })
	use({ "utilyre/barbecue.nvim", tag = "*", requires = { "SmiteshP/nvim-navic" } })

	--> Icon picker
	use({ "stevearc/dressing.nvim", requires = { "ziontee113/icon-picker.nvim" } })

	--> Colorscheme
	use({ "themercorp/themer.lua" }) -- Themes management
	use({ "nvim-lualine/lualine.nvim" }) -- statusbar

	--> DAP
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			--"mxsdev/nvim-dap-vscode-js",
		},
	})

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
			{ "nvim-telescope/telescope-dap.nvim" },
		},
	})

	--> LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "RubixDev/mason-update-all" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{
				"dsznajder/vscode-es7-javascript-react-snippets",
				run = "yarn install --frozen-lockfile && yarn compile",
			}, -- snippets JS

			-- for formatters and linters
			{ "jose-elias-alvarez/null-ls.nvim" },
			-- null-ls servers lsp
			{ "jayp0521/mason-null-ls.nvim" },
		},
	})
	--> Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
