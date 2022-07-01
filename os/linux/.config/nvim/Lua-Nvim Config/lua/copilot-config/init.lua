require("copilot").setup({
	cmp = {
		enable = true,
		method = "getCompletionsCycling",
	},
	panel = { -- no config options yet
		--enabled = true,
    enabled = false,
	},
	ft_disable = {},
	plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
	server_opts_overrides = {
    trace = "verbose",
    settings = {
      advanced = {
        listCount = 10, -- #completions for panel
        inlineSuggestCount = 3, -- #completions for getCompletions
      }
    },
  },
})
