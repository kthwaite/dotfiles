local au = require("utility").au
-- # helm filetype
vim.filetype.add({
	filename = {
		["helmfile*.yaml"] = "helm",
	},
	extension = {
		gotmpl = "helm",
	},
	pattern = {
		["*/templates/*.yaml"] = "helm",
		["*/templates/*.tpl"] = "helm",
	},
})
-- Use {{/* */}} as comments
au("FileType", "helm", "setlocal commentstring={{/* %s */}}")
