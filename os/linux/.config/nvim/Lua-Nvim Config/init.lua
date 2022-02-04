require("plugins")
require("mappings")
require("settings")
--> IDE
require("autopairs-config")
require("indent-blankline-config")
require("hop-config")
--require("colorizer-config")
--> Themes
require("colorschemes-config")
require("lualine-config")
--> NerdTree
require("nvim-tree-config")
--> LSP
require("lsp-config.language-servers")
require("lsp-config.nvim-cmp")
require("lsp-config.lspsaga")
--require("lsp-config.null-ls") --formateer when save file
--> Treesitter
require("treesitter-config")
--> Git
require("gitsigns-config")
