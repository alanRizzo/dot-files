-- Configuración de which-key + registro de descripciones (español)
-- Coloca este archivo en: ~/.config/nvim/lua/config/which_key.lua

local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = true },
  },
  window = {
    border = "single",
  },
  layout = {
    align = "center",
  },
})

-- Leader maps principales (centrados en workflow Python / desarrollo backend)
local leader_maps = {
  f = { name = "Archivo / Formato" },
  ["ff"] = { "<cmd>Telescope find_files hidden=true<cr>", "Buscar archivos" },
  ["fg"] = { "<cmd>Telescope live_grep<cr>", "Buscar en proyecto" },
  ["fb"] = { "<cmd>Telescope buffers<cr>", "Listar buffers" },
  ["fr"] = { "<cmd>lua require('conform').format({ async = true })<cr>", "Formatear (conform)" },

  l = { name = "LSP / Código" },
  ["ld"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Ir a definición" },
  ["lr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Referencias" },
  ["lh"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  ["li"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementación" },
  ["la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Acciones de código" },
  ["ln"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Renombrar símbolo" },

  t = { name = "Test / Debug" },
  ["tt"] = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
  ["tr"] = { "<cmd>lua require('dap').continue()<cr>", "Run/Continue DAP" },
  ["ts"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test: método" },
  ["tS"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test: clase" },

  g = { name = "Git" },
  ["gs"] = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
  ["gp"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
  ["gb"] = { "<cmd>Gitsigns blame_line<cr>", "Blame línea" },

  p = { name = "Python / Entorno" },
  ["pv"] = { "<cmd>lua print('Seleccionar venv: implementa tu selector aquí')<cr>", "Seleccionar venv" },
  ["pr"] = { "<cmd>TermExec cmd='pytest -q'<cr>", "Run pytest (toggleterm)" },
}

wk.register(leader_maps, { prefix = "<leader>" })

-- Mappings globales (no líder) con descripción para which-key popup
local global_maps = {
  ["<C-s>"] = { "<cmd>w<cr>", "Guardar archivo" },
  ["<C-q>"] = { "<cmd>q<cr>", "Cerrar Neovim" },
  ["<Esc>"] = { "<cmd>noh<cr>", "Apagar resaltado búsqueda" },

  -- Ventanas: mostrar descripción para movimientos con Ctrl
  ["<C-h>"] = { "<C-w>h", "Ir a ventana izquierda" },
  ["<C-j>"] = { "<C-w>j", "Ir a ventana abajo" },
  ["<C-k>"] = { "<C-w>k", "Ir a ventana arriba" },
  ["<C-l>"] = { "<C-w>l", "Ir a ventana derecha" },
}

wk.register(global_maps)