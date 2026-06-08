-- ===================================================================
-- Opciones Generales de Neovim
-- ===================================================================

local opt = vim.opt

-- UI
opt.number = true -- Números de línea
opt.relativenumber = true -- Números relativos
opt.signcolumn = "yes" -- Columna de signos siempre visible
opt.cursorline = true -- Resaltar línea actual
opt.termguicolors = true -- Colores 24-bit
opt.pumheight = 10 -- Altura del menú de completado

-- Indentación (Python y React)
opt.expandtab = true -- Espacios en lugar de tabs
opt.shiftwidth = 4 -- Ancho de indentación
opt.tabstop = 4 -- Ancho de tab
opt.softtabstop = 4 -- Tab en modo insert
opt.smartindent = true -- Auto-indentación inteligente

-- Búsqueda
opt.ignorecase = true -- Ignorar mayúsculas en búsqueda
opt.smartcase = true -- Sensible si incluye mayúsculas
opt.hlsearch = true -- Resaltar resultados

-- Edición
opt.scrolloff = 8 -- Líneas visibles arriba/abajo del cursor
opt.sidescrolloff = 8 -- Columnas visibles a los lados
opt.wrap = false -- No ajustar líneas largas
opt.mouse = "a" -- Habilitar mouse

-- Performance
opt.updatetime = 300 -- Tiempo para actualizar (ms)
opt.timeoutlen = 500 -- Tiempo para secuencias de teclas (which-key)
opt.timeout = true -- Habilitar timeout

-- Backup y swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true -- Historial de deshacer persistente

-- Clipboard
opt.clipboard = "unnamedplus" -- Usar clipboard del sistema

-- Split windows
opt.splitright = true -- Nuevos splits verticales a la derecha
opt.splitbelow = true -- Nuevos splits horizontales abajo

-- Completado
opt.completeopt = { "menu", "menuone", "noselect" }

-- Archivos
vim.g.loaded_netrw = 1 -- Deshabilitar netrw (usaremos nvim-tree)
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_prog = vim.fn.expand("~/Projects/pynvim/.venv/bin/python3")
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
