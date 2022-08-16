-- telescope modules
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_utils = require("telescope.actions.utils")

local hop_actions = {}
local hop_config = require("telescope._extensions.hop.config")

hop_actions._hop = function(prompt_bufnr, opts)
	opts = opts or {}
	opts.keys = vim.F.if_nil(opts.keys, hop_config.keys)
	opts.sign_hl = vim.F.if_nil(opts.sign_hl, hop_config.sign_hl)
	opts.line_hl = vim.F.if_nil(opts.line_hl, hop_config.line_hl)
	opts.sign_virt_text_pos = vim.F.if_nil(opts.sign_virt_text_pos, hop_config.sign_virt_text_pos)
	opts.clear_selection_hl = vim.F.if_nil(opts.clear_selection_hl, hop_config.clear_selection_hl)

	-- validate hl groups
	local val_hl = function(hl)
		local t = type(hl)
		if t == "string" or t == "nil" then
			return true
		end
		if t == "table" then
			if not #t == 2 then
				print("A table of highlight groups must comprise two highlight groups")
				return false
			end
			return true
		end
	end
	vim.validate({
		opts = { opts, "table" },
		[opts.keys] = { opts.keys, "table" },
		[opts.sign_hl] = {
			opts.sign_hl,
			val_hl,
			"Passed highlight groups have to be either string or tables",
		},
		-- line_hl can be nil => pass arg name explicitly
		["line_hl"] = {
			opts.line_hl,
			val_hl,
			"Passed highlight groups have to be either string or tables",
		},
	})

	-- telescope state
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local max_results = current_picker.max_results
	local num_results = current_picker.manager:num_results()
	local results_bufnr = current_picker.results_bufnr
	local sorting_strategy = current_picker.sorting_strategy

	-- namespaces
	local ns = vim.api.nvim_create_namespace("teleshopping")
	local ns_line_hl = vim.api.nvim_create_namespace("teleshopping_line_hl")
	local telescope_selection_ns = vim.api.nvim_create_namespace("telescope_selection")

	if opts.clear_selection_hl then
		vim.api.nvim_buf_clear_namespace(results_bufnr, telescope_selection_ns, 0, -1)
	end

	local keyline = {}
	for i = 1, math.min(num_results, max_results, #opts.keys) do
		local key = opts.keys[i]
		local linenr = sorting_strategy == "descending" and max_results - i or i

		if opts.line_hl ~= nil then
			local line_hl = type(opts.line_hl) == "table" and opts.line_hl[math.pow(2, i % 2)] or opts.line_hl
			-- full line highlighting
			vim.api.nvim_buf_set_extmark(
				results_bufnr,
				ns_line_hl,
				linenr,
				0, -- beyond text
				{
					end_line = linenr + 1,
					hl_group = line_hl,
					hl_eol = true,
				}
			)
		end

		local sign_hl = type(opts.sign_hl) == "table" and opts.sign_hl[math.pow(2, i % 2)] or opts.sign_hl
		vim.api.nvim_buf_set_extmark(results_bufnr, ns, linenr, 0, {
			virt_text = { { key, sign_hl } },
			virt_text_pos = opts.sign_virt_text_pos,
			hl_mode = "combine",
		})

		keyline[key] = linenr
	end
	-- ensure marks are drawn before getchar is executed
	vim.cmd([[redraw]])

	local char = vim.fn.getchar()
	local key = vim.fn.nr2char(char)

	if keyline[key] ~= nil then
		current_picker:set_selection(keyline[key])
		if opts.callback ~= nil then
			opts.callback(prompt_bufnr)
		end
	end

	-- callback can delete results_bufnr
	if vim.api.nvim_buf_is_valid(results_bufnr) then
		vim.api.nvim_buf_clear_namespace(results_bufnr, ns, 0, -1)
		vim.api.nvim_buf_clear_namespace(results_bufnr, ns_line_hl, 0, -1)
		-- restore selection hl
		-- if opts.clear_selection_hl then
		--   local caret = current_picker.selection_caret
		--   local row = current_picker:get_selection_row()
		--   current_picker.highlighter:hi_selection(row, caret:sub(1, -2))
		-- end
	end
	return key
end

hop_actions.hop = function(prompt_bufnr)
	hop_actions._hop(prompt_bufnr, {})
end

hop_actions._hop_loop = function(prompt_bufnr, opts)
	vim.validate({
		opts = { opts, "table", true },
	})
	opts = opts or {}
	local escape_keys = vim.tbl_map(function(key)
		return vim.api.nvim_replace_termcodes(key, true, false, true)
	end, vim.F.if_nil(opts.escape_keys, hop_config.escape_keys))
	local accept_keys = vim.tbl_map(function(key)
		return vim.api.nvim_replace_termcodes(key, true, false, true)
	end, vim.F.if_nil(opts.accept_keys, hop_config.accept_keys))

	local trace_entry = vim.F.if_nil(opts.trace_entry, hop_config.trace_entry)
	local clear_selection_hl = vim.F.if_nil(opts.clear_selection_hl, hop_config.clear_selection_hl)
	local reset_selection = vim.F.if_nil(opts.reset_selection, hop_config.reset_selection)

	vim.validate({
		trace_entry = {
			trace_entry,
			function()
				return not (clear_selection_hl and trace_entry)
			end,
			"Tracing entry is mutually exclusive with clearing selection",
		},
	})
	vim.validate({
		reset_selection = {
			reset_selection,
			function()
				return reset_selection or trace_entry
			end,
			"At least one of tracing or resetting selection must be set",
		},
	})
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local row = current_picker:get_selection_row()

	while true do
		local key = hop_actions._hop(prompt_bufnr, opts)
		if vim.tbl_contains(accept_keys, key) then
			break
		end
		if vim.tbl_contains(escape_keys, key) then
			return
		end
		if not trace_entry then
			current_picker:set_selection(row)
		end
	end
	if reset_selection then
		current_picker:set_selection(row)
	end
	if opts.loop_callback ~= nil then
		opts.loop_callback(prompt_bufnr)
	end
	return
end

--- Iteratively toggle selection on hop char with default configuration until escape keys are registered.
hop_actions.hop_toggle_selection = function(prompt_bufnr)
	hop_actions._hop_loop(prompt_bufnr, { callback = actions.toggle_selection })
end

return hop_actions
