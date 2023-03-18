local dap, dapui, dap_go = require("dap"), require("dapui"), require("dap-go")

require("nvim-dap-virtual-text").setup({})

dap_go.setup()

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 80,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom",
		},
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })

-- DAP python
dap.adapters.python = {
	type = "executable",
	command = "/home/osito/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
	args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
	type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
	request = "launch",
	name = "Launch file",
	program = "${file}", -- This configuration will launch the current file if used.
	pythonPath = function()
		local cwd = vim.fn.getcwd()
		if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
			return cwd .. "/venv/bin/python"
		elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
			return cwd .. "/.venv/bin/python"
		else
			return "/usr/bin/python"
		end
	end,
}

-- DAP PHP
dap.adapters.php = {
	type = "executable",
	command = "php-debug-adapter",
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Laravel",
		port = 9003,
		pathMappings = {
			["/usr/share/nginx/html/"] = "${workspaceFolder}",
		},
	},
	{
		type = "php",
		request = "launch",
		name = "Symfony",
		port = 9003,
		pathMappings = {
			["/app"] = "${workspaceFolder}",
		},
	},
}

-- DAP JS
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}
dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}
-- DAP JS CHROME
dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

for _, language in pairs({ "typescriptreact", "javascriptreact" }) do
	require("dap").configurations[language] = {
		{
			type = "chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	}
end

require("dap-vscode-js").setup({
	debugger_cmd = { "js-debug-adapter" },
	adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end

for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-chrome",
			name = "Attach - Remote Debugging",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			name = "Launch Chrome",
			request = "launch",
			url = "http://localhost:3000",
		},
	}
end

-- Events Listeners
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({})
end
