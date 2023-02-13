local M = {}

--
M.au = function(event, pattern, callback)
	local cbtype = "command"
	if type(callback) == "function" then
		cbtype = "callback"
	end
	vim.api.nvim_create_autocmd(event, {
		pattern = pattern,
		[cbtype] = callback,
	})
end
--
M.map = vim.keymap.set
--
M.nnoremap = function(capt, repl, opts)
	opts = opts or {}
	opts["noremap"] = true
	vim.keymap.set("n", capt, repl, opts)
end
--
M.inoremap = function(capt, repl, opts)
	opts = opts or {}
	opts["noremap"] = true
	vim.keymap.set("i", capt, repl, opts)
end
--
M.noremap = function(capt, repl, opts)
	opts = opts or {}
	opts["noremap"] = true
	vim.keymap.set("", capt, repl, opts)
end
return M
