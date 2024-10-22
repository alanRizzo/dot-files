return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      -- async = false,
      -- quiet = false,
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
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
