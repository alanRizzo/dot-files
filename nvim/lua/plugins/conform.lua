-- ===================================================================
-- Conform.nvim - Formateo moderno y rápido
-- ===================================================================

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Python
        python = { "black", "isort" },

        -- Lua
        lua = { "stylua" },

        -- JavaScript/TypeScript/React
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        -- Web
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },

      -- Configuración de formatters
      formatters = {
        black = {
          prepend_args = { "--fast", "--line-length", "88" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        prettier = {
          prepend_args = { "--single-quote", "--jsx-single-quote" },
        },
      },

      -- Formatear al guardar
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    -- Comando manual para formatear
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      conform.format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
  end,
}
