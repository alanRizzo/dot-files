-- ===================================================================
-- Keymaps - Atajos de Teclado
-- ===================================================================

local keymap = vim.keymap.set

-- Modo Normal --

-- Navegación mejorada
keymap("n", "<C-h>", "<C-w>h", { desc = "Ir a ventana izquierda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Ir a ventana abajo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Ir a ventana arriba" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Ir a ventana derecha" })

-- Redimensionar ventanas
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Aumentar altura" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Reducir altura" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Reducir ancho" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Aumentar ancho" })

-- Navegación de buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Siguiente buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Buffer anterior" })
keymap("n", "<S-d>", ":bdelete<CR>", { desc = "Cerrar buffer" })

-- Guardar y salir
keymap("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Salir" })
keymap("n", "<leader>Q", ":qa!<CR>", { desc = "Salir forzado" })

-- Limpiar búsqueda
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "Limpiar resaltado" })
keymap("n", "<Esc>", ":nohlsearch<CR>", { desc = "Limpiar resaltado" })

-- Mover líneas
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover línea abajo" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover línea arriba" })

-- Modo Visual --

-- Mantener selección al indentar
keymap("v", "<", "<gv", { desc = "Indentar izquierda" })
keymap("v", ">", ">gv", { desc = "Indentar derecha" })

-- Mover líneas seleccionadas
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover selección abajo" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover selección arriba" })

-- Pegar sin perder el contenido del registro
keymap("v", "p", '"_dP', { desc = "Pegar sin reemplazar registro" })

-- Comentar/descomentar con Ctrl+c
keymap("n", "<C-c>", "gcc", { desc = "Comentar línea", remap = true })
keymap("v", "<C-c>", "gc", { desc = "Comentar selección", remap = true })

-- Modo Insert --

-- Salir de insert mode rápido
keymap("i", "jk", "<ESC>", { desc = "Salir de insert mode" })
keymap("i", "kj", "<ESC>", { desc = "Salir de insert mode" })

-- Modo Terminal --

-- Salir del modo terminal
keymap("t", "<ESC>", "<C-\\><C-n>", { desc = "Salir modo terminal" })
keymap("t", "jk", "<C-\\><C-n>", { desc = "Salir modo terminal" })
