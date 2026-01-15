local keymap = vim.keymap.set
-- KEYBINDS
vim.g.mapleader = " "
keymap("n", "<leader>e", vim.cmd.Oil)

keymap("v", "J", ":m '>+1<CR>gv=gv") -- Alt Up/Down in vscode
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<S-TAB>", "<C-^>", {}) -- previous buffer

keymap("n", "J", "mzJ`z") -- Remap joining lines
keymap("n", "<C-d>", "<C-d>zz") -- Keep cursor in place while moving up/down page
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv") -- center screen when looping search results
keymap("n", "N", "Nzzzv")

-- clear search highlights when Esc is pressed
keymap("n", "<Esc>", function()
	vim.cmd("nohlsearch")
end)

-- paste and don't replace clipboard over deleted text
keymap("x", "<leader>p", [["_dP]])
keymap({ "n", "v" }, "<leader>d", [["_d]])

-- sometimes in insert mode, control-c doesn't exactly work like escape
keymap("i", "<C-c>", "<Esc>")

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")

-- What the heck is Ex mode?
keymap("n", "Q", "<nop>")

keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all instances of whatever is under cursor (on line)
keymap("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- Better indenting
keymap("v", "<", "<gv", {})
keymap("v", ">", ">gv", {})

-- reload without exiting vim
keymap("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

keymap("n", "<leader>fc", "<cmd>FzfLua builtin<CR>")
keymap("n", "<leader>ff", "<cmd>FzfLua git_files<CR>")
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>")
keymap("n", "<leader>fg", "<cmd>FzfLua grep_project<CR>")
keymap("n", "<leader>fl", "<cmd>FzfLua grep_last<CR>")
keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>")
keymap("n", "<leader>fs", "<cmd>FzfLua git_stash<CR>")
keymap("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Previous diagnostic" })

-- qflist
keymap("n", "<leader>q", "<cmd>copen<cr>", {})
keymap("n", "<leader>Q", "<cmd>cclose<cr>", {})

-- Lsp
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
keymap("n", "<C-f>", "<cmd>Format<CR>")
-- keymap("n", "<leader>lb", "<cmd>lua vim.diagnostic.setqflist()<CR>", { desc = "Previous diagnostic" }, {})
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostic" })
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous diagnostic" })
keymap("n", "<leader>lb", "<cmd>FzfLua diagnostics_document<CR>", { desc = "Previous diagnostic" })
keymap("n", "<leader>lg", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Previous diagnostic" })
keymap("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "References" })
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Previous diagnostic" })
