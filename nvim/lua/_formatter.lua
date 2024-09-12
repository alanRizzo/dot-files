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
		groovy = { "npm-groovy-lint" },
		json = { "fixjson" },
		toml = { "taplo" },
	},
	format_on_save = {
		lsp_format = "fallback",
		async = false,
		quiet = false,
		timeout_ms = 300,
	},
})

local function set_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		callback = function()
			vim.bo.filetype = filetype
		end,
	})
end

-- Set filetype for Dockerfile and Jenkinsfile
set_filetype("Dockerfile*", "Dockerfile")
set_filetype("Jenkinsfile*", "groovy")
