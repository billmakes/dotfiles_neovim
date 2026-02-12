vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/wellle/context.vim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/esmuellert/nvim-eslint" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/benomahony/oil-git-status.nvim" },
	{ src = "https://github.com/JezerM/oil-lsp-diagnostics.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/tpope/vim-rhubarb" },
})

local ok_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
if ok_ts then
	ts_configs.setup({
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"json",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"python",
			"rust",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	})
end

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		bash = { "beautysh" },
	},
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range }, function(err, did_edit)
		print(did_edit)
	end)
end, { range = true })

require("nvim-eslint").setup({})

require("oil").setup({
	win_options = {
		signcolumn = "yes:2",
	},
	view_options = {
		show_hidden = true,
	},
})

require("oil-git-status").setup({
	show_ignored = true,
	symbols = {
		index = {
			["!"] = "!",
			["?"] = "?",
			["A"] = "A",
			["C"] = "C",
			["D"] = "D",
			["M"] = "M",
			["R"] = "R",
			["T"] = "T",
			["U"] = "U",
			[" "] = " ",
		},
		working_tree = {
			["!"] = "!",
			["?"] = "?",
			["A"] = "A",
			["C"] = "C",
			["D"] = "D",
			["M"] = "M",
			["R"] = "R",
			["T"] = "T",
			["U"] = "U",
			[" "] = " ",
		},
	},
})

require("oil-lsp-diagnostics").setup({})

require("mason").setup({})

require("mason-lspconfig").setup({
	automatic_enable = {
		exclude = {
			"ts_ls",
		},
	},
	ensure_installed = {
		"lua_ls",
		"vtsls",
		"html",
		"cssls",
		"jsonls",
		"bashls",
		"pyright",
	},
})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-----------------------------------------------------------------------
		-- Hunk Navigation
		-----------------------------------------------------------------------
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end) -- Next git hunk (or diff change)

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end) -- Previous git hunk (or diff change)

		-----------------------------------------------------------------------
		-- Staging & Reset
		-----------------------------------------------------------------------
		map("n", "<leader>hs", gitsigns.stage_hunk) -- Stage hunk under cursor
		map("n", "<leader>hr", gitsigns.reset_hunk) -- Reset hunk under cursor
		map("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end) -- Stage selected lines
		map("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end) -- Reset selected lines
		map("n", "<leader>hS", gitsigns.stage_buffer) -- Stage entire buffer
		map("n", "<leader>hR", gitsigns.reset_buffer) -- Reset entire buffer

		-----------------------------------------------------------------------
		-- Preview & Diff
		-----------------------------------------------------------------------
		map("n", "<leader>hp", gitsigns.preview_hunk) -- Preview hunk in popup
		map("n", "<leader>hi", gitsigns.preview_hunk_inline) -- Preview hunk inline
		map("n", "<leader>hd", gitsigns.diffthis) -- Diff against index
		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end) -- Diff against last commit

		-----------------------------------------------------------------------
		-- Blame
		-----------------------------------------------------------------------
		map("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end) -- Show full blame for current line

		-----------------------------------------------------------------------
		-- Quickfix
		-----------------------------------------------------------------------
		map("n", "<leader>hq", gitsigns.setqflist) -- Send buffer hunks to quickfix
		map("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end) -- Send all hunks to quickfix

		-----------------------------------------------------------------------
		-- Toggles
		-----------------------------------------------------------------------
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame) -- Toggle inline blame
		map("n", "<leader>tw", gitsigns.toggle_word_diff) -- Toggle word diff

		-----------------------------------------------------------------------
		-- Text Object
		-----------------------------------------------------------------------
		map({ "o", "x" }, "ih", gitsigns.select_hunk) -- Select hunk (inner)
	end,
})

require("fidget").setup({})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" }, -- Accept completion or newline
		["<C-space>"] = {}, -- Disabled
		["<C-p>"] = {}, -- Disabled
		["<Tab>"] = {}, -- Disabled
		["<S-Tab>"] = {}, -- Disabled
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" }, -- Toggle completion/docs
		["<C-n>"] = { "select_and_accept" }, -- Select and accept completion
		["<C-k>"] = { "select_prev", "fallback" }, -- Select previous item
		["<C-j>"] = { "select_next", "fallback" }, -- Select next item
		["<C-b>"] = { "scroll_documentation_down", "fallback" }, -- Scroll docs down
		["<C-f>"] = { "scroll_documentation_up", "fallback" }, -- Scroll docs up
		["<C-l>"] = { "snippet_forward", "fallback" }, -- Jump to next snippet placeholder
		["<C-h>"] = { "snippet_backward", "fallback" }, -- Jump to previous snippet placeholder
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" }, -- Accept and execute command
		},
	},

	sources = { default = { "lsp" } },
})

-------------------------------------------------------------------------------
-- FzfLua (Fuzzy Finder) - clean defaults + toggles
-------------------------------------------------------------------------------
local fzf = require("fzf-lua")
local actions = require("fzf-lua.actions")

fzf.setup({
	-- Files: use rg to enumerate files (fast + respects globs)
	files = {
		cmd = table.concat({
			"rg --files",
			"--hidden",
			"--follow",
			"--no-messages",
			"--glob '!.git/**'",
			"--glob '!node_modules/**'",
			"--glob '!dist/**'",
			"--glob '!build/**'",
			"--glob '!target/**'",
			"--glob '!.cache/**'",
		}, " "),
	},

	-- Grep: let fzf-lua manage live_grep reloading; just give it rg options
	grep = {
		actions = {
			["ctrl-q"] = actions.file_sel_to_qf,
		},
		rg_opts = table.concat({
			"--column",
			"--line-number",
			"--no-heading",
			"--color=always",
			"--smart-case",
			"--hidden",
			"--follow",
			"--no-messages",
			"--glob",
			"!.git/**",
			"--glob",
			"!node_modules/**",
			"--glob",
			"!dist/**",
			"--glob",
			"!build/**",
			"--glob",
			"!target/**",
			"--glob",
			"!.cache/**",
		}, " "),
	},
})
