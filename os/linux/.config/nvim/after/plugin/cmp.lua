local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local ls_ok, ls = pcall(require, "luasnip")
if not ls_ok then
	vim.notify("luasnip load failed")
	return
end
-- enble html snippets in javascript/javascript(React)/typescript/typescript(React)/django/blade
ls.filetype_extend("javascript", { "html" })
ls.filetype_extend("typescript", { "html" })
ls.filetype_extend("javascriptreact", { "html" })
ls.filetype_extend("typescriptreact", { "html" })
ls.filetype_extend("htmldjango", { "html" })
ls.filetype_extend("htmldblade", { "html" })

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
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
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				--luasnip = "[Snippet]",
				--buffer = "[Buffer]",
				--path = "[path]",
				--orignal config 4 lines down
				nvim_lsp = "[LSP]",
        copilot = "[Copilot ]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		--{ name = "friendly-snippets" },
		--{ name = "nvim_lsp" },
		--{ name = "luasnip" },
		-- orignal config 4 lines down
    { name = "nvim_lsp" },
    { name = "copilot" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
  -- copilot
  sorting = {
    --keep priority weight at 2 for much closer matches to appear above copilot
    --set to 1 to make copilot always appear on top
    priority_weight = 1,
    comparators = {
      -- order matters here
      cmp.config.compare.exact,
      require("copilot_cmp.comparators").prioritize,
      require("copilot_cmp.comparators").score,
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
      -- personal settings:
      -- cmp.config.compare.recently_used,
      -- cmp.config.compare.offset,
      -- cmp.config.compare.score,
      -- cmp.config.compare.sort_text,
      -- cmp.config.compare.length,
      -- cmp.config.compare.order,
    },
  },
  preselect = cmp.PreselectMode.Item,
})

--set max height of items
--vim.cmd([[ set pumheight=6 ]])
--set highlights
--local highlights = {
  -- type highlights
  --CmpItemKindText = { fg = "LightGrey" },
  --CmpItemKindFunction = { fg = "#C586C0" },
  --CmpItemKindClass = { fg = "Orange" },
  --CmpItemKindKeyword = { fg = "#f90c71" },
  --CmpItemKindSnippet = { fg = "#565c64" },
  --CmpItemKindConstructor = { fg = "#ae43f0" },
  --CmpItemKindVariable = { fg = "#9CDCFE", bg = "NONE" },
  --CmpItemKindInterface = { fg = "#f90c71", bg = "NONE" },
  --CmpItemKindFolder = { fg = "#2986cc" },
  --CmpItemKindReference = { fg = "#922b21" },
  --CmpItemKindMethod = { fg = "#C586C0" },
  --CmpItemKindCopilot = { fg = "#6CC644" },
  --CmpItemMenu = { fg = "#C586C0", bg = "#C586C0" },
  --CmpItemAbbr = { fg = "#565c64", bg = "NONE" },
  --CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
  --CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
  --CmpMenuBorder = { fg="#263341" },
  --CmpMenu = { bg="#10171f" },
  --CmpSelection = { bg="#263341" },
--}
--for group, hl in pairs(highlights) do
  --vim.api.nvim_set_hl(0, group, hl)
--end
