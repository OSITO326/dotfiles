-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
	return
end

local mason_update_ok, mason_update_all = pcall(require, "mason-update-all")
if not mason_update_ok then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- mason update all
-- Events message update all lsp servers mason installed
local update_message = vim.api.nvim_create_autocmd("User", {
	pattern = "MasonUpdateAllComplete",
	callback = function()
		print("mason-update-all has finished!")
	end,
})
mason_update_all.setup({
	update_message,
})

-- configure mason_null_ls
mason_null_ls.setup({
	ensure_installed = {
		"black",
		"djlint",
		"eslint_d",
		"prettier",
		"stylua",
		"sql_formatter",
	},
	automatic_installation = true,
})

-- configure null_ls
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- before
--on_attach = function(client, bufnr)
--if client.supports_method("textDocument/formatting") then
--vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--vim.api.nvim_create_autocmd("BufWritePre", {
--group = augroup,
--buffer = bufnr,
--callback = function()
---- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--vim.lsp.buf.format({ bufnr = bufnr })
----vim.lsp.buf.formatting_sync()
--end,
--})
--end
--end,

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
	-- configure format on save
	sources = {
		formatting.stylua, -- formatting lua (install -> sudo pacman -S stylua)
		formatting.prettier.with({
			extra_args = { "--single-quote", "--jsx-single-quote" },
		}), -- formatting JS/TS (install -> npm i -g prettier)
		formatting.black.with({ extra_args = { "--fast" } }), -- format python (install -> pip3 install black)
		diagnostics.flake8.with({ extra_args = { "--max-line-length=160" } }), -- diagnostics pthon (install -> pip3 install flake8)
		formatting.djlint.with({ extra_args = { "$FILENAME", "--reformat", "--lint" } }), -- formatting {django, jinja.html, htmldjando} (install -> pip3 install djlint or npm i -g djlint)
		formatting.djhtml.with({ extra_args = { "-t=2" } }), --formatting {django, jinja.html, htmldjango} (install -> pip install djhtml)
	},
})
