require("lsp.lua_ls")

vim.diagnostic.config({
	signs = true,
	underline = true,
	virtual_text = {
		source = true,
	},
	float = {
		source = true,
	},
})
