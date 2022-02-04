local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostic = null_ls.builtins.diagnostics

local sources = {
    formatting.eslint,
    --formatting.autopep8,
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    --formatting.clang_format,
}

local diagnostics = {
    diagnostic.pylint,
}
-->install
-- npm install -g eslint
-- pacman -S autopep8 python-pycodestyle python-pylint python-black
-- yay -S stylua

null_ls.setup({
    sources = sources,
    diagnostics,

    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
})
