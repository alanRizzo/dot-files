-- ===================================================================
-- LSP Configuration - Language Server Protocol
-- ===================================================================

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Capacidades de autocompletado
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Función para ejecutar cuando se adjunta un LSP
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      local keymap = vim.keymap.set

      -- Keymaps LSP
      keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Ir a declaración" }))
      keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Ir a definición" }))
      keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover información" }))
      keymap("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Ir a implementación" }))
      keymap("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Ver referencias" }))
      keymap("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Renombrar" }))
      keymap(
        "n",
        "<leader>la",
        vim.lsp.buf.code_action,
        vim.tbl_extend("force", opts, { desc = "Acciones de código" })
      )
      keymap("n", "<leader>lf", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, vim.tbl_extend("force", opts, { desc = "Formatear código" }))
      keymap("n", "<leader>ld", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Ver diagnóstico" }))
      keymap("n", "[d", function()
        vim.diagnostic.jump({ count = -1, float = false })
      end, vim.tbl_extend("force", opts, { desc = "Diagnóstico anterior" }))
      keymap("n", "]d", function()
        vim.diagnostic.jump({ count = 1, float = false })
      end, vim.tbl_extend("force", opts, { desc = "Diagnóstico siguiente" }))
    end

    -- Configuración de diagnósticos
    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      update_in_insert = false,
      underline = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })

    -- Mostrar diagnósticos inline solo en la línea del cursor
    local ns = vim.api.nvim_create_namespace("cursor_diagnostics")
    local current_line = -1

    local function wrap_message(message, max_width, prefix)
      if max_width < 20 then
        return { message }
      end

      local lines = {}
      local current = ""
      local indent = "  "

      for word in message:gmatch("%S+") do
        local test_line = current == "" and word or (current .. " " .. word)
        local line_prefix = #lines == 0 and prefix or indent

        if #test_line + #line_prefix > max_width then
          if current ~= "" then
            table.insert(lines, current)
          end
          current = word
        else
          current = test_line
        end
      end

      if current ~= "" then
        table.insert(lines, current)
      end

      return lines
    end

    local function show_diagnostics()
      local bufnr = vim.api.nvim_get_current_buf()
      local line = vim.api.nvim_win_get_cursor(0)[1] - 1

      -- Solo actualizar si cambiamos de línea
      if line == current_line then
        return
      end
      current_line = line

      -- Limpiar diagnósticos anteriores
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

      -- Obtener diagnósticos de la línea actual
      local line_diagnostics = vim.diagnostic.get(bufnr, { lnum = line })

      if #line_diagnostics == 0 then
        return
      end

      -- Calcular ancho disponible
      local win_width = vim.api.nvim_win_get_width(0)
      local line_text = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1] or ""
      local line_len = vim.fn.strdisplaywidth(line_text)
      local available_width = win_width - line_len - 5

      -- Preparar líneas virtuales
      local virt_lines = {}
      local first_diagnostic_shown = false

      for i, diagnostic in ipairs(line_diagnostics) do
        local severity = diagnostic.severity
        local hl_group = "DiagnosticVirtualText" .. vim.diagnostic.severity[severity]

        -- Elegir ícono según severidad
        local icon = ""
        if severity == vim.diagnostic.severity.ERROR then
          icon = ""
        elseif severity == vim.diagnostic.severity.WARN then
          icon = ""
        elseif severity == vim.diagnostic.severity.HINT then
          icon = "󰠠"
        elseif severity == vim.diagnostic.severity.INFO then
          icon = ""
        end

        local prefix = " " .. icon .. " "
        local message = diagnostic.message
        local wrapped = wrap_message(message, available_width, prefix)

        if i == 1 and not first_diagnostic_shown then
          -- Primer diagnóstico: primera línea inline
          vim.api.nvim_buf_set_extmark(bufnr, ns, line, 0, {
            virt_text = { { prefix .. wrapped[1], hl_group } },
            virt_text_pos = "eol",
          })
          first_diagnostic_shown = true

          -- Líneas adicionales del primer diagnóstico
          for j = 2, #wrapped do
            table.insert(virt_lines, { { "  " .. wrapped[j], hl_group } })
          end
        else
          -- Diagnósticos adicionales completos en líneas virtuales
          for j = 1, #wrapped do
            local line_prefix = j == 1 and prefix or "  "
            table.insert(virt_lines, { { line_prefix .. wrapped[j], hl_group } })
          end
        end
      end

      -- Agregar líneas virtuales si hay contenido
      if #virt_lines > 0 then
        vim.api.nvim_buf_set_extmark(bufnr, ns, line, 0, {
          virt_lines = virt_lines,
          virt_lines_above = false,
        })
      end
    end

    -- Actualizar diagnósticos al mover el cursor
    vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
      callback = show_diagnostics,
    })

    -- Configurar servidores LSP usando vim.lsp.config (nueva API)

    -- Lua
    vim.lsp.config.lua_ls = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
            },
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    }

    -- Python (Pyright)
    vim.lsp.config.pyright = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
        },
      },
    }

    -- Python (Ruff)
    vim.lsp.config.ruff = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- TypeScript/JavaScript
    vim.lsp.config.ts_ls = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
          },
        },
      },
    }

    -- HTML
    vim.lsp.config.html = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- CSS
    vim.lsp.config.cssls = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Tailwind CSS
    vim.lsp.config.tailwindcss = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- JSON
    vim.lsp.config.jsonls = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Habilitar todos los servidores configurados
    vim.lsp.enable({ "lua_ls", "pyright", "ruff", "ts_ls", "html", "cssls", "tailwindcss", "jsonls" })
  end,
}
