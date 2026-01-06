local function filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return ""
	end

	return string.format("%%<%s/", fpath)
end

local function git()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end

	local head = git_info.head
	local added = (git_info.added and git_info.added > 0) and (" +" .. git_info.added) or ""
	local changed = (git_info.changed and git_info.changed > 0) and (" ~" .. git_info.changed) or ""
	local removed = (git_info.removed and git_info.removed > 0) and (" -" .. git_info.removed) or ""

	return ("[git: %s%s%s%s]"):format(head, added, changed, removed)
end

local function diagnostics()
	local status = vim.diagnostic.status()
	if not status or status == "" then
		return ""
	end
	return "[" .. status .. "]"
end

local function uniq_sorted(list)
	local seen, out = {}, {}
	for _, v in ipairs(list) do
		if v and v ~= "" and not seen[v] then
			seen[v] = true
			table.insert(out, v)
		end
	end
	table.sort(out)
	return out
end

local function lsps()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if not clients or #clients == 0 then
		return ""
	end

	local names = {}
	for _, c in ipairs(clients) do
		table.insert(names, c.name)
	end

	names = uniq_sorted(names)
	return "[lsp: " .. table.concat(names, ",") .. "]"
end

-- LSP format-capable clients (what vim.lsp.buf.format() could use)
local function lsp_formatters()
	local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" })
	if not clients or #clients == 0 then
		return ""
	end

	local names = {}
	for _, c in ipairs(clients) do
		table.insert(names, c.name)
	end

	names = uniq_sorted(names)
	return "[fmt: " .. table.concat(names, ",") .. "]"
end

-- Conform "will run" list for this buffer
local function conform_formatters()
	local ok, conform = pcall(require, "conform")
	if not ok then
		return ""
	end

	local list = conform.list_formatters_to_run(0)
	if not list or #list == 0 then
		return ""
	end

	local names = {}
	for _, item in ipairs(list) do
		table.insert(names, item.name or tostring(item))
	end

	names = uniq_sorted(names)
	return "[conform: " .. table.concat(names, ",") .. "]"
end

local function join_parts(parts, sep)
	sep = sep or " "
	local out = {}
	for _, p in ipairs(parts) do
		if p and p ~= "" then
			table.insert(out, p)
		end
	end
	return table.concat(out, sep)
end

Statusline = {}

function Statusline.active()
	return join_parts({
		"[" .. filepath() .. "%t]",
		git(),
		diagnostics(),
		lsps(),
		conform_formatters(),
		lsp_formatters(),
		"%=",
		"%y [%P %l:%c]",
	}, " ")
end

function Statusline.inactive()
	return " %t"
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = group,
	desc = "Activate statusline on focus",
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end
		if vim.api.nvim_win_get_config(0).relative ~= "" then
			return
		end
		vim.opt_local.statusline = "%!v:lua.Statusline.active()"
		vim.cmd("redrawstatus")
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = group,
	desc = "Deactivate statusline when unfocused",
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end
		if vim.api.nvim_win_get_config(0).relative ~= "" then
			return
		end
		vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
	end,
})
