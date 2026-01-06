vim.lsp.config['cssls'] = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css', 'scss', 'less' },
    init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
    root_markers = { 'package.json', '.git' },
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}

vim.lsp.config['jsonls'] = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    init_options = {
        provideFormatter = true,
    },
    root_markers = { '.git' },
}

vim.lsp.config['html'] = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html', 'templ' },
    root_markers = { 'package.json', '.git' },
    settings = {},
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { 'html', 'css', 'javascript' },
    },
}
