return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		{ "williamboman/mason.nvim", run = ":MasonUpdate" },
		"williamboman/mason-lspconfig.nvim",
		"RubixDev/mason-update-all",
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		{ "dsznajder/vscode-es7-javascript-react-snippets", build = "yarn install --frozen-lockfile && yarn compile" },
		-- For Formatters and Linters
		"jose-elias-alvarez/null-ls.nvim",
		-- null-ls servers lsp
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		require("osito.lsp")
	end,
}
