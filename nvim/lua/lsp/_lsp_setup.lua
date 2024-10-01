local status_ok, lsp_setup = pcall(require, "lsp-setup")
if not status_ok then
	return
end

lsp_setup.setup({
	-- Default mappings
	default_mappings = false,
	mappings = {
		gD = "lua vim.lsp.buf.declaration()",
		gd = "lua vim.lsp.buf.definition()",
		gt = "lua vim.lsp.buf.type_definition()",
		gi = "lua vim.lsp.buf.implementation()",
		gr = "lua vim.lsp.buf.references()",
		K = "lua vim.lsp.buf.hover()",
		["<C-k>"] = "lua vim.lsp.buf.signature_help()",
		["<space>rn"] = "lua vim.lsp.buf.rename()",
		["<space>ca"] = "lua vim.lsp.buf.code_action()",
		["<space>e"] = "lua vim.diagnostic.open_float()",
		["[d"] = "lua vim.diagnostic.goto_prev()",
		["]d"] = "lua vim.diagnostic.goto_next()",
	},
	servers = {
		lua_ls = require("lsp.settings._lua_ls"),
		-- cucumber_language_server = require("lsp.settings._cucumber"),
		dockerls = {},
		yamlls = {},
		basedpyright = require("lsp.settings._basedpyright"),
		bashls = {},
		--ruff = require("lsp.settings._ruff"),
	},
	inlay_hints = {
		enabled = true,
	},
})
