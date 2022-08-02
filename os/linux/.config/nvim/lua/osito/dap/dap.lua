local dap, dapui, dap_install = require("dap"), require("dapui"), require("dap-install")
local api = vim.api

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position.
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        --"scopes",
        --"breakpoints",
        --"stacks",
        --"watches",
      },
      size = 50,
      position = "right",
    },
    {
      elements = {
        --"repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

require("dap-go").setup()

vim.fn.sign_define("DapBreakpoint", { text = "ß", texthl = "", linehl = "", numhl = "" })

--dap_install.config("php", {
	--configurations = {
		--{
			--type = "php",
			--request = "launch",
			--name = "Listen for Xdebug",
			--port = 9003,
			--pathMappings = function()
				--local sail = vim.call("composer#query", "require-dev.laravel/sail")
				--if sail == "" then
					--return { ["/app"] = vim.fn.getcwd() }
				--end
				----return { ["/var/www/html"] = vim.fn.getcwd() }
        --return { ["/usr/share/nginx/html"] = vim.fn.getcwd() }
			--end,
		--},
	--},
--})
-- with command :DIInstall packages
-- configurations packages (https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)
dap_install.config("jsnode",
  {
    adapters = {
      type = 'executable',
      command = 'node',
      args = {os.getenv('HOME') ..'/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js'},

    },
    configurations = {
      {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
      },
    },
  }
)

dap_install.config("chrome",
  {
    adapters = {
      type = "executable",
      command = "node",
      args = {os.getenv('HOME').."/.local/share/nvim/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js"},
    },
    configurations = {
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
)

dap_install.config("dart",
  {
    adapters = {
      type = 'executable',
      command = 'node',
      args = {os.getenv('HOME')..".local/share/nvim/dapinstall/dart/Dart-Code/out/dist/debug.js", "flutter"}
    },
    configurations = {
      type = "dart",
      request = "launch",
      name = "Launch flutter",
      --dartSdkPath = os.getenv('HOME').."/flutter/bin/cache/dart-sdk/",
      --flutterSdkPath = os.getenv('HOME').."/flutter",
      dartSdkPath = os.getenv('HOME').."/opt/flutter/bin/cache/dart-sdk/",
      flutterSdkPath = os.getenv('HOME').."/opt/flutter/bin/",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    },
  }
)

--dap_install.config("firefox",
  --{
    --adapters = {
      --type = "executable",
      --command = "node",
      --args = {os.getenv('HOME').."/.local/share/nvim/dapinstall/firefox/vscode-firefox-debug/dist/adapter.bundle.js"},
    --},
    --configurations = {
      --name = "Debug with Firefox",
      --type = "firefox",
      --request = "launch",
      --reAttach = true,
      --url = "http://localhost:3000",
      --webRoot = "${workspaceFolder}",
      --firefoxExecutable = "/usr/bin/firefox",
    --},
  --}
--)

dap.adapters.python = {
  type = "executable";
  command = {os.getenv('HOME').."/.local/share/nvim/dapinstall/python/bin/python"};
  args = {"-m", "debugpy.adapter"};
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";
    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

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
-- mappings
--vim.keymap.set("n", "<leader>dbp", require("dap").toggle_breakpoint, { noremap = true })
--vim.keymap.set("n", "<leader>dd", require("dap").continue, { noremap = true })
----vim.keymap.set("n", "<leader>de", require("osito.dap.dap-fn").stop, { noremap = true })
--vim.keymap.set("n", "<leader>de", require("osito.dap.dap-fn").stop, { noremap = true })
--vim.keymap.set("n", "<leader>dl", require("dap").step_into, { noremap = true })
--vim.keymap.set("n", "<leader>dj", require("dap").step_over, { noremap = true })
--vim.keymap.set("n", "<leader>dk", require("dap").step_out, { noremap = true })
--vim.keymap.set("n", "<leader>dt", require("dap").repl.toggle, { noremap = true })
----vim.keymap.set("n", "<leader>ds", require("osito.dap.dap-fn").scopes, { noremap = true })
----vim.keymap.set("n", "<leader>da", require("osito.dap.dap-fn").fullscopes, { noremap = true })
--vim.keymap.set("n", "<leader>ds", require("osito.dap.dap-fn").scopes, { noremap = true })
--vim.keymap.set("n", "<leader>da", require("osito.dap.dap-fn").fullscopes, { noremap = true })
--vim.keymap.set("n", "<leader>dbl", require("dap").list_breakpoints, { noremap = true })
--vim.keymap.set("n", "<leader>dbc", require("dap").clear_breakpoints, { noremap = true })
--vim.keymap.set("n", "<leader>dc", require("dap").run_to_cursor, { noremap = true })
--vim.keymap.set("v", "<leader>dk", require("dapui").eval, { noremap = true })
-- can be skipped since I can do it running the continue and promt to use the "Debug test"
--vim.keymap.set("n", "<leader>dtt", require("dap-go").debug_test, { noremap = true })
