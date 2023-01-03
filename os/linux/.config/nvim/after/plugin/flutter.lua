local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
	return
end

-- alternatively you can override the default configs
flutter_tools.setup({
	ui = {
		border = "rounded",
		notification_style = "native",
	},
	decorations = {
		statusline = {
			app_version = false,
			device = false,
		},
	},
	debugger = {
		enabled = false,
		run_via_dap = false,
		exception_breakpoints = {},
		register_configurations = function(paths)
			require("dap").configurations.dart = { "$HOME/.vscode/launch.js" }
		end,
	},
	flutter_path = "/bin/flutter",
	flutter_lookup_cmd = nil,
	fvm = false,
	widget_guides = {
		enabled = false,
	},
	closing_tags = {
		highlight = "ErrorMsg",
		prefix = ">",
		enabled = true,
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
		--on_attach = my_custom_on_attach,
		--capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
		----- OR you can specify a function to deactivate or change or control how the config is created
		--capabilities = function(config)
		--config.specificThingIDontWant = false
		--return config
		--end,
		settings = {
			showTodos = true,
			completeFunctionCall = true,
			analysisExcludeFolders = { "/opt/flutter/" },
		},
	},
})
