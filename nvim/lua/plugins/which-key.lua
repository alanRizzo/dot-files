-- ===================================================================
-- Which-key - Muestra atajos de teclado disponibles
-- ===================================================================

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  priority = 200,
  opts = {
    preset = "modern",
    delay = 10,
    icons = {
      mappings = false,
    },
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
    },
    layout = {
      spacing = 3,
    },
    show_help = true,
    show_keys = true,
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Definir grupos de teclas (nueva API)
    wk.add({
      { "<leader>f", group = "Files" },
      { "<leader>l", group = "LSP" },
      { "<leader>g", group = "Git" },
      { "<leader>d", group = "Debug" },
      { "<leader>t", group = "Test" },
      { "<leader>c", group = "Code" },
      { "<leader>b", group = "Buffers" },
      { "<leader>e", desc = "Toggle explorador" },
      { "<leader>w", desc = "Save" },
      { "<leader>q", desc = "Quit" },
      { "<leader>h", desc = "Clear search" },
      { "<leader>x", desc = "Close buffer" },
    })
  end,
}
