local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup({ keys = "etovxqpdygfblzhckisuran" })

local cmd = vim.cmd
cmd("hi HopNextKey guifg=#FE8019")
cmd("hi HopNextKey1 guifg=#FE8019")
cmd("hi HopNextKey2 guifg=#FE8019")
