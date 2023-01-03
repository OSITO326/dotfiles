pcall(require, "impatient")

if require("osito.first_load")() then
	return
end

require("osito.settings")
require("osito.plugins")
require("osito.telescope.telescope")
