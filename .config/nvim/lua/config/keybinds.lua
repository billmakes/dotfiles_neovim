-- KEYBINDS
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Alt Up/Down in vscode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<S-TAB>", "<C-^>", {}) -- previous buffer

vim.keymap.set("n", "J", "mzJ`z")           -- Remap joining lines
vim.keymap.set("n", "<C-d>", "<C-d>zz")     -- Keep cursor in place while moving up/down page
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")           -- center screen when looping search results
vim.keymap.set("n", "N", "Nzzzv")

-- paste and don't replace clipboard over deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


-- sometimes in insert mode, control-c doesn't exactly work like escape
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- What the heck is Ex mode?
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all instances of whatever is under cursor (on line)
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- Better indenting
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})

-- reload without exiting vim
vim.keymap.set("n", "<leader>rl", "<cmd>source ~/.config/nvim/init.lua<cr>")

-- Lspsaga
vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Outline" }, {})
vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code action" }, {})
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", {})
vim.keymap.set("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>", { desc = "Show buffer diagnostic" }, {})
vim.keymap.set("n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Next diagnostic" }, {})
vim.keymap.set("n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Previous diagnostic" }, {})
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {})
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Lsp Info" }, {})
