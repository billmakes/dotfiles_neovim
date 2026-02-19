-- keymaps
local keymap = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

-------------------------------------------------------------------------------
-- File Explorer
-------------------------------------------------------------------------------
keymap("n", "<leader>e", vim.cmd.Oil) -- Open Oil file explorer

-------------------------------------------------------------------------------
-- Buffer Navigation
-------------------------------------------------------------------------------
keymap("n", "<S-TAB>", "<C-^>", {}) -- Switch to previous buffer

-------------------------------------------------------------------------------
-- Movement & Scrolling
-------------------------------------------------------------------------------
keymap("n", "<C-d>", "<C-d>zz") -- Scroll down half page, keep cursor centered
keymap("n", "<C-u>", "<C-u>zz") -- Scroll up half page, keep cursor centered
keymap("n", "n", "nzzzv") -- Next search result, keep cursor centered
keymap("n", "N", "Nzzzv") -- Previous search result, keep cursor centered

-------------------------------------------------------------------------------
-- Line Manipulation
-------------------------------------------------------------------------------
keymap("n", "J", "mzJ`z") -- Join lines without moving cursor
keymap("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines down
keymap("v", "K", ":m '<-2<CR>gv=gv") -- Move selected lines up

-------------------------------------------------------------------------------
-- Indentation
-------------------------------------------------------------------------------
keymap("v", "<", "<gv", {}) -- Indent left and reselect
keymap("v", ">", ">gv", {}) -- Indent right and reselect

-------------------------------------------------------------------------------
-- Clipboard & Delete Operations
-------------------------------------------------------------------------------
keymap("x", "<leader>p", [["_dP]]) -- Paste without replacing clipboard
keymap({ "n", "v" }, "<leader>d", [["_d]]) -- Delete to black hole register

-------------------------------------------------------------------------------
-- Search
-------------------------------------------------------------------------------
keymap("n", "<Esc>", function()
	vim.cmd("nohlsearch")
end) -- Clear search highlights

keymap("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]]) -- Replace word under cursor (on line)

-------------------------------------------------------------------------------
-- Quickfix List
-------------------------------------------------------------------------------
keymap("n", "<C-k>", "<cmd>cnext<CR>zz") -- Next quickfix item
keymap("n", "<C-j>", "<cmd>cprev<CR>zz") -- Previous quickfix item
keymap("n", "<leader>q", "<cmd>copen<cr>", {}) -- Open quickfix list
keymap("n", "<leader>Q", "<cmd>cclose<cr>", {}) -- Close quickfix list

-------------------------------------------------------------------------------
-- Location List
-------------------------------------------------------------------------------
keymap("n", "<leader>k", "<cmd>lnext<CR>zz") -- Next location list item
keymap("n", "<leader>j", "<cmd>lprev<CR>zz") -- Previous location list item

-------------------------------------------------------------------------------
-- Mode Escape
-------------------------------------------------------------------------------
keymap("i", "<C-c>", "<Esc>") -- Escape insert mode with Ctrl-C
keymap("n", "Q", "<nop>") -- Disable Ex mode

-------------------------------------------------------------------------------
-- Config
-------------------------------------------------------------------------------
keymap("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>") -- Reload Neovim config

-------------------------------------------------------------------------------
-- FzfLua (Fuzzy Finder)
-------------------------------------------------------------------------------
keymap("n", "<leader>fc", "<cmd>FzfLua builtin<CR>") -- Open FzfLua command picker
keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>") -- Find files in git repo
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>") -- List open buffers
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>")
keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>") -- Search help tags
keymap("n", "<leader>fs", "<cmd>FzfLua git_stash<CR>") -- Browse git stash
keymap("n", "<leader>fld", "<cmd>FzfLua diagnostics_document<CR>") -- Document diagnostics
keymap("n", "<leader>flD", "<cmd>FzfLua diagnostics_workspace<CR>") -- Document diagnostics
keymap("n", "<leader>flr", "<cmd>FzfLua lsp_references<CR>") -- Document diagnostics
keymap("n", "<leader>fr", "<cmd>FzfLua resume<CR>") -- Document diagnostics

-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------

keymap("x", "<leader>gl", ":<C-u>execute 'Git log -L ' . line(\"'<\") . ',' . line(\"'>\") . ':%'<CR>")
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {}) -- Show hover documentation
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>") -- Go to definition
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>") -- Show references
keymap("n", "<C-f>", "<cmd>Format<CR>") -- Format buffer
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- Code action menu
keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>") -- Show diagnostic in float
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>") -- Next diagnostic
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>") -- Previous diagnostic
keymap("n", "<leader>lb", "<cmd>FzfLua diagnostics_document<CR>") -- List buffer diagnostics
keymap("n", "<leader>lg", "<cmd>FzfLua diagnostics_workspace<CR>") -- List workspace diagnostics
keymap("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>") -- List references



keymap("n", "<leader>gg", "<cmd>Git<CR>") -- Browse git stash
