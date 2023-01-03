local dap, dapui, dap_go = require("dap"), require("dapui"), require("dap-go")
local api = vim.api

require("nvim-dap-virtual-text").setup({})

dap_go.setup({})

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		expand = { "CR", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_live = vim.fn.has("nvim-0.7"),
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.33 },
				{ id = "breakpoints", size = 0.17 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 0.33,
			position = "right",
		},
		{
			elements = {
				{ id = "repl", size = 0.45 },
				{ id = "console", size = 0.55 },
			},
			size = 0.27,
			position = "bottom",
		},
	},
	floating = {
		max_height = 0.9, -- These can be integers or a float between 0 and 1.
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		--border = "single", -- Border style. Can be "single", "double" or "rounded"
		border = vim.g.border_chars,
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	--windows = { indent = 1 },
	--render = {
	--max_type_length = nil, -- Can be integer or nil.
	--},
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define(
	"DapStopped",
	{ text = "", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })
--vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
--vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "", numhl = "" })
--vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })
--vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
--vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })

-- All DAP configurations
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
dap.adapters.python = {
	type = "executable",
	command = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/python/bin/python" },
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
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
	},
}

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
--dap.configurations.javascriptreact = {
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}",
--}
--dap.configurations.typescriptreact = {
--type = "chrome",
--request = "attach",
--program = "${file}",
--cwd = vim.fn.getcwd(),
--sourceMaps = true,
--protocol = "inspector",
--port = 9222,
--webRoot = "${workspaceFolder}",
--}

-- Events Listeners
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

local function with_win(win, fn, ...)
	local cur_win = api.nvim_get_current_win()
	api.nvim_set_current_win(win)
	local ok, err = pcall(fn, ...)
	api.nvim_set_current_win(cur_win)
	assert(ok, err)
end

local function jump_to_location(bufnr, line, column)
	-- vscode-go sends columns with 0
	-- That would cause a "Column value outside range" error calling nvim_win_set_cursor
	-- nvim-dap says "columnsStartAt1 = true" on initialize :/
	if column == 0 then
		column = 1
	end
	for _, tab in pairs(api.nvim_list_tabpages()) do
		for _, win in pairs(api.nvim_tabpage_list_wins(tab)) do
			if api.nvim_win_get_buf(win) == bufnr then
				api.nvim_win_set_cursor(win, { line, column - 1 })
				api.nvim_set_current_tabpage(tab)
				api.nvim_set_current_win(win)
				return
			end
		end
	end
	-- TODO review
	-- Buffer isn't active in any window; use the first window that is not special
	-- (Don't want to move to code in the REPL...)
	for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
		local winbuf = api.nvim_win_get_buf(win)
		if api.nvim_buf_get_option(winbuf, "buftype") == "" then
			local bufchanged, _ = pcall(api.nvim_win_set_buf, win, bufnr)
			if bufchanged then
				api.nvim_win_set_cursor(win, { line, column - 1 })
				with_win(win, api.nvim_command, "normal zv")
				return
			end
		end
	end
end

dap.listeners.after["event_stopped"]["alpha"] = function(session, body)
	if body.reason ~= "breakpoint" then
		return
	end
	if not session.current_frame then
		return
	end
	local path = session.current_frame.source.path
	local line = session.current_frame.line
	local column = session.current_frame.column

	local bufnr = vim.uri_to_bufnr(vim.uri_from_fname(path))
	vim.fn.bufload(bufnr)
	jump_to_location(bufnr, line, column)
end
