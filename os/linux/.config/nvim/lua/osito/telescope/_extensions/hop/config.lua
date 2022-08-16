-- config table named `telescope_hop` for more suitable docgen
local telescope_hop = {}

telescope_hop.setup = function(opts)
  -- general telescope_hopuration
  telescope_hop.keys = vim.F.if_nil(opts.keys, { 
    "a", "s", "d", "f", "g", "h", "j", "k", "l", ";",
    "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
    "A", "S", "D", "F", "G", "H", "J", "K", "L", ":",
    "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", })
  telescope_hop.sign_hl = vim.F.if_nil(opts.sign_hl, "Search")
  telescope_hop.line_hl = opts.line_hl
  telescope_hop.sign_virt_text_pos = opts.sign_virt_text_pos == "right_align" and "right_align"
    or "overlay"
  telescope_hop.clear_selection_hl = vim.F.if_nil(opts.clear_selection_hl, true)
  -- hop loop specific configuration
  telescope_hop.trace_entry = vim.F.if_nil(opts.trace_entry, false)
  telescope_hop.reset_selection = vim.F.if_nil(opts.reset_selection, true)
  telescope_hop.escape_keys = vim.tbl_map(function(key)
    return vim.api.nvim_replace_termcodes(key, true, false, true)
  end, vim.F.if_nil(
    opts.escape_keys,
    { "<ESC>", "<C-c>" }
  ))
  telescope_hop.accept_keys = vim.tbl_map(function(key)
    return vim.api.nvim_replace_termcodes(key, true, false, true)
  end, vim.F.if_nil(
    opts.escape_keys,
    { "<CR>" }
  ))
end

return telescope_hop
