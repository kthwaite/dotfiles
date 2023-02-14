local M = {}

--
M.au = function(event, pattern, callback, opts)
    local cbtype = "command"
    if type(callback) == "function" then
        cbtype = "callback"
    end
    opts = opts or {}
    opts['pattern'] = pattern
    opts[cbtype] = callback
    vim.api.nvim_create_autocmd(event, opts)
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
--
M.version_string = function()
    local version = vim.version()
    local version_line = "UNKNOWN"
    if version ~= nil then
        version_line = " v" .. version.major .. "." .. version.minor .. "." .. version.patch
    end
    return version_line
end

return M
