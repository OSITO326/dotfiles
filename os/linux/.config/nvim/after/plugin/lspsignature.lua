local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
	return
end

local signature_config = {
	debug = true,
	hint_enable = true,
	handler_opts = { border = "single" },
	max_width = 80,
}

lsp_signature.setup(signature_config)
lsp_signature.status_line(max_width)
