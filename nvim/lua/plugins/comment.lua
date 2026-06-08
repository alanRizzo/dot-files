-- ===================================================================
-- Comment.nvim - Comentar código fácilmente
-- ===================================================================

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- Atajos de teclado por defecto:
    -- gcc: comentar/descomentar línea (normal)
    -- gc: comentar/descomentar selección (visual)
    -- gbc: comentar/descomentar bloque (normal)
    -- gb: comentar/descomentar bloque (visual)

    padding = true,
    sticky = true,
    ignore = "^$",

    toggler = {
      line = "gcc",
      block = "gbc",
    },

    opleader = {
      line = "gc",
      block = "gb",
    },

    extra = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },

    mappings = {
      basic = true,
      extra = true,
    },
  },
}
