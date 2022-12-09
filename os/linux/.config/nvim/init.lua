pcall(require, "impatient")

if require("osito.first_load")() then
	return
end

require("osito.settings")
require("osito.plugins")
require("osito.lsp")
--require("osito.dap.dap")
require("osito.telescope.telescope")
