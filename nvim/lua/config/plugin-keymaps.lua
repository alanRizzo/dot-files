-- ===================================================================
-- Plugin Keymaps - Atajos para plugins (se cargan después de lazy)
-- ===================================================================

local wk = require("which-key")

wk.add({
  -- Telescope
  { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
  { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto" },
  { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buscar buffers" },
  { "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Archivos recientes" },
  { "<leader>c", "<cmd>Telescope grep_string<cr>", desc = "Buscar palabra bajo cursor" },
  { "<leader>k", "<cmd>Telescope keymaps<cr>", desc = "Buscar keymaps" },
  { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Símbolos del documento" },
  { "<leader>H", "<cmd>Telescope help_tags<cr>", desc = "Buscar ayuda" },

  -- Nvim-tree
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle explorador" },

  -- Mason
  { "<leader>lm", "<cmd>Mason<cr>", desc = "Abrir Mason" },

  -- Lazy
  { "<leader>ll", "<cmd>Lazy<cr>", desc = "Abrir Lazy" },
})
