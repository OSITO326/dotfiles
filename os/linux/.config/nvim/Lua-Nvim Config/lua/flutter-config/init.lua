-- alternatively you can override the default configs
require("flutter-tools").setup({
	ui = {
		-- the border type to use for all floating windows, the same options/formats
		-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		border = "rounded",
		-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
		-- please note that this option is eventually going to be deprecated and users will need to
		-- depend on plugins like `nvim-notify` instead.
		--notification_style = 'native' | 'plugin'
		notification_style = "native",
	},
	decorations = {
		statusline = {
			-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
			-- this will show the current version of the flutter app from the pubspec.yaml file
			app_version = false,
			-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
			-- this will show the currently running device if an application was started with a specific
			-- device
			device = false,
		},
	},
	debugger = { -- integrate with nvim dap + install dart code debugger
		--enabled = false,
		enabled = true,
		run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
		register_configurations = function(paths)
			require("dap").configurations.dart = { "$HOME/.vscode/launch.json" }
		end,
	},
	flutter_path = "/bin/flutter", -- <-- this takes priority over the lookup
	flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
	fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
	widget_guides = {
		enabled = false,
	},
	closing_tags = {
		highlight = "ErrorMsg", -- highlight for the closing tag
		prefix = ">", -- character to use for close tag e.g. > Widget
		enabled = true, -- set to false to disable
	},
	dev_log = {
		enabled = true,
		open_cmd = "tabedit", -- command to use to open the log buffer
	},
	dev_tools = {
		autostart = false, -- autostart devtools server if not detected
		auto_open_browser = false, -- Automatically opens devtools in the browser
	},
	outline = {
		open_cmd = "30vnew", -- command to use to open the outline buffer
		auto_open = false, -- if true this will open the outline automatically when it is first populated
	},
	lsp = {
		color = { -- show the derived colours for dart variables
			enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
			background = false, -- highlight the background
			foreground = false, -- highlight the foreground
			virtual_text = true, -- show the highlight using virtual text
			virtual_text_str = "■", -- the virtual text character to highlight
		},
		--on_attach = require("../lsp-config.handlers"),
		--capabilities = require("../lsp-config.handlers"), -- e.g. lsp_status capabilities
		--- OR you can specify a function to deactivate or change or control how the config is created
		--capabilities = function(config)
		--config.specificThingIDontWant = false
		--return config
		--end,
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			analysisExcludedFolders = { "/opt/flutter/" },
		},
	},
})