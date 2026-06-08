-- ===================================================================
-- Auto-pairs - Cierre automático de paréntesis, llaves, etc.
-- ===================================================================

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true, -- Usar treesitter
    ts_config = {
      lua = { "string" }, -- No agregar pares en strings de lua
      javascript = { "template_string" }, -- No agregar pares en template strings
      java = false, -- Deshabilitar para java
    },
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  },
  config = function(_, opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(opts)

    -- Integración con cmp
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
