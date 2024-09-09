local status_ok, formatter = pcall(require, "conform")
if not status_ok then
	return
end

formatter.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = {
			-- To fix auto-fixable lint errors.
			"ruff_fix",
			-- To run the Ruff formatter.
			"ruff_format",
			-- To organize the imports.
			"ruff_organize_imports",
		},
		rust = { "rustfmt" },
	},
	format_on_save = {
		lsp_format = "fallback",
		async = false,
		timeout_ms = 1000,
	},
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "Jenkinsfile*",
	command = "set filetype=groovy",
})
