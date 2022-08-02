local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "osito.lsp.lsp-installer"
require("osito.lsp.handlers").setup()
require "osito.lsp.null-ls"
