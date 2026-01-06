require("lsp.lua_ls")
require("lsp.vtsls")
-- require("lsp.ts_ls")
require("lsp.vscode")
require("lsp.pyright")

vim.lsp.enable({
    "bashls",
    "lua_ls",
    "vtsls",
    "cssls",
    "jsonls",
    "html",
    -- "ts_ls",
    "yamlls",
    "pyright",
})
vim.diagnostic.config({ signs = true })
