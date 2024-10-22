return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	opts = {
		format_on_save = {
			timeout_ms = 500,
			-- async = false,
			-- quiet = false,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			-- lua = { "stylua" },
			python = {
				"ruff_fix",
				"ruff_format",
				"ruff_organize_imports",
			},
			groovy = { "npm-groovy-lint" },
			json = { "fixjson" },
			toml = { "taplo" },
			zsh = { "beautysh" },
			sh = { "shfmt" },
		},
	},
}
