local lsp = require("lsp-zero")
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

lsp.preset("recommended")

lsp.ensure_installed({
	"cssmodules_ls",
	"cssls",
	--"dartls",
	"eslint",
	"emmet_ls",
	"html",
	"intelephense",
	"jsonls",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tsserver",
})

local kind_icons = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "ﰠ  ",
	Variable = "  ",
	Class = "ﴯ  ",
	Interface = "  ",
	Module = "  ",
	Property = "ﰠ  ",
	Unit = "塞  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "פּ  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

--local cmp_select = { behavior = cmp.SelectBehavior.Select }
--local cmp_mappings = lsp.defaults.cmp_mappings({
--["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--["<S-j>"] = cmp.mapping.select_next_item(cmp_select),
--["<S-k>"] = cmp.mapping.select_prev_item(cmp_select),
--["<C-y>"] = cmp.mapping.confirm({ select = true }),
--["<C-Space>"] = cmp.mapping.complete(),
--})

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local cmp_mappings = cmp.mapping.preset.insert({
	["<C-k>"] = cmp.mapping.select_prev_item(),
	["<C-j>"] = cmp.mapping.select_next_item(),
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	}),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expandable() then
			luasnip.expand()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif check_backspace() then
			fallback()
		else
			fallback()
		end
	end, {
		"i",
		"s",
	}),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, {
		"i",
		"s",
	}),
})
-- disable completion with tab
-- this helps with copilot setup
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "",
		warn = "",
		hint = "",
		info = "",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	--if client.name == "eslint" then
	--vim.cmd.LspStop("eslint")
	--return
	--end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	}),
	formatting = {
		fields = { "abbr", "kind" },
		format = function(_, vim_item)
			vim_item.kind = (kind_icons[vim_item.kind] or " ") .. vim_item.kind
			return vim_item
		end,
	},
})
