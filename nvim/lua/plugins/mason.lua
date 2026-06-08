-- ===================================================================
-- Mason - Gestor de LSP, DAP, Linters y Formatters
-- ===================================================================

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    priority = 999,
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        -- LSP servers para Python y React
        ensure_installed = {
          "lua_ls", -- Lua LSP (primero para Neovim)
          "pyright", -- Python LSP
          "ruff", -- Python linter/formatter
          "ts_ls", -- TypeScript/JavaScript LSP
          "tailwindcss", -- Tailwind CSS
          "html", -- HTML LSP
          "cssls", -- CSS LSP
          "jsonls", -- JSON LSP
        },
        automatic_installation = true,
        -- NO configurar handlers aquí, se hace en lsp.lua
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        -- Herramientas para formateo
        ensure_installed = {
          "black", -- Python formatter
          "isort", -- Python import sorter
          "prettier", -- JavaScript/TypeScript/React formatter
          "stylua", -- Lua formatter
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
}
