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
    --['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    --['<space>f'] = 'lua vim.lsp.buf.formatting()',
    ["<space>e"] = "lua vim.diagnostic.open_float()",
    ["[d"] = "lua vim.diagnostic.goto_prev()",
    ["]d"] = "lua vim.diagnostic.goto_next()",
    --gd = 'lua require"telescope.builtin".lsp_definitions()',
    --gi = 'lua require"telescope.builtin".lsp_implementations()',
    --gr = 'lua require"telescope.builtin".lsp_references()',
  },
  servers = {
    pylsp = require("lsp.settings._pylsp"),
    --pyright = require("lsp.settings._pyright"),
    lua_ls = require("lsp.settings._lua_ls"),
    --rome = require("lsp.settings._rome"),
    quick_lint_js = require("lsp.settings._quick_lint_js"),
    tsserver = require("lsp.settings._tsserver"),
  },
})
