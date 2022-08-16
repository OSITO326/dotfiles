local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error "This extension requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local hop_actions = require "telescope._extensions.hop.actions"
local hop_config = require "telescope._extensions.hop.config"

return telescope.register_extension {
  setup = hop_config.setup,
  exports = hop_actions,
}
