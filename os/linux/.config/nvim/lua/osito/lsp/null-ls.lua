local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		--formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		--formatting.black.with({ extra_args = { "--fast" } }),
		--formatting.stylua,
		---- diagnostics.flake8
		--base configuration
		--formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }), --formatting JS/TS
		formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }), --formatting JS/TS (install -> npm i -g prettier)
		formatting.black.with({ extra_args = { "--fast" } }), --format python (install -> pip3 install black)
		diagnostics.flake8.with({ extra_args = { "--max-line-length=160" } }), --diagnostics python (install -> pip3 install flake8)
		formatting.djlint.with({ extra_args = { "$FILENAME", "--reformat", "--lint" } }), --formatting {django, jinja.html, htmldjango} (install -> pip3 install djlint or npm i -g djlint)
		formatting.djhtml.with({ extra_args = { "-t=2" } }), --formatting {django, jinja.html, htmldjango} (install -> pip install djhtml)
		formatting.stylua, --formatting lua (install -> sudo pacman -S stylua)
		formatting.sql_formatter.with({}), --formatting sql (install -> npm install -g sql-formatter)
	},
})
