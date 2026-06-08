# 🚀 Configuración de Neovim para Python y React

Configuración moderna y completa de Neovim optimizada para desarrollo en Python y React/TypeScript.

## ✨ Características

- 🎯 **LSP completo** para Python (Pyright, Ruff) y TypeScript/React
- 🔍 **Búsqueda fuzzy** con Telescope
- 📁 **Explorador de archivos** con nvim-tree
- ✍️ **Autocompletado inteligente** con nvim-cmp
- 🎨 **Resaltado de sintaxis** avanzado con Treesitter
- 🔧 **Formateo automático** con Black y Prettier
- 🔀 **Integración Git** con Gitsigns
- ⌨️ **Guía de atajos** con Which-key
- 🎭 **Cursor animado** con Smear-cursor
- 🎨 **Tema Catppuccin** moderno y elegante

## 📦 Plugins Incluidos

### Gestión de Plugins
- **lazy.nvim** - Gestor de plugins moderno y rápido
- **mason.nvim** - Gestor de LSP, formatters y linters

### LSP y Autocompletado
- **nvim-lspconfig** - Configuración de servidores LSP
- **nvim-cmp** - Motor de autocompletado
- **LuaSnip** - Motor de snippets
- **friendly-snippets** - Colección de snippets

### Navegación y Búsqueda
- **telescope.nvim** - Buscador fuzzy universal
- **nvim-tree.lua** - Explorador de archivos
- **nvim-treesitter** - Análisis de sintaxis avanzado

### Git
- **gitsigns.nvim** - Indicadores de cambios Git

### Edición
- **nvim-autopairs** - Cierre automático de paréntesis
- **Comment.nvim** - Comentar código fácilmente
- **nvim-ts-autotag** - Auto-cierre de tags HTML/JSX

### Formateo y Linting
- **none-ls.nvim** - Formateo y linting
- **black** - Formateador Python
- **isort** - Organizador de imports Python
- **prettier** - Formateador JavaScript/React
- **eslint_d** - Linter JavaScript

### UI/Estética
- **lualine.nvim** - Barra de estado elegante
- **catppuccin** - Tema de colores moderno
- **which-key.nvim** - Guía de atajos de teclado
- **smear-cursor.nvim** - Animación del cursor
- **indent-blankline.nvim** - Guías de indentación

## ⚡ Instalación

1. **Respalda tu configuración actual** (si existe):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. **Esta configuración ya está lista**, solo abre Neovim:
```bash
nvim
```

3. **Lazy.nvim instalará automáticamente** todos los plugins en el primer inicio.

4. **Instala los servidores LSP** con Mason:
```vim
:Mason
```

## ⌨️ Atajos de Teclado Principales

### General
| Atajo | Acción |
|-------|--------|
| `<Space>` | Leader key |
| `<Space>w` | Guardar archivo |
| `<Space>q` | Salir |
| `<Space>h` | Limpiar búsqueda |
| `jk` o `kj` | Salir de modo Insert |

### Navegación de Ventanas
| Atajo | Acción |
|-------|--------|
| `<C-h/j/k/l>` | Moverse entre ventanas |
| `<C-Up/Down/Left/Right>` | Redimensionar ventanas |

### Buffers
| Atajo | Acción |
|-------|--------|
| `<S-l>` | Siguiente buffer |
| `<S-h>` | Buffer anterior |
| `<Space>x` | Cerrar buffer |

### Explorador de Archivos (nvim-tree)
| Atajo | Acción |
|-------|--------|
| `<Space>ee` | Toggle explorador |
| `<Space>ef` | Buscar archivo en explorador |
| `<Space>ec` | Colapsar explorador |

### Búsqueda (Telescope)
| Atajo | Acción |
|-------|--------|
| `<Space>ff` | Buscar archivos |
| `<Space>fg` | Buscar texto en archivos |
| `<Space>fb` | Buscar buffers |
| `<Space>fr` | Archivos recientes |
| `<Space>fh` | Buscar ayuda |

### LSP
| Atajo | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gD` | Ir a declaración |
| `gr` | Ver referencias |
| `K` | Mostrar documentación |
| `<Space>lr` | Renombrar símbolo |
| `<Space>la` | Acciones de código |
| `<Space>lf` | Formatear código |
| `[d` / `]d` | Navegar diagnósticos |

### Git (Gitsigns)
| Atajo | Acción |
|-------|--------|
| `]c` / `[c` | Navegar cambios |
| `<Space>gs` | Stage hunk |
| `<Space>gr` | Reset hunk |
| `<Space>gp` | Preview hunk |
| `<Space>gb` | Git blame |

### Comentarios
| Atajo | Acción |
|-------|--------|
| `gcc` | Comentar línea |
| `gc` (visual) | Comentar selección |
| `gbc` | Comentar bloque |

### Autocompletado
| Atajo | Acción |
|-------|--------|
| `<Tab>` | Siguiente sugerencia |
| `<S-Tab>` | Sugerencia anterior |
| `<CR>` | Confirmar |
| `<C-Space>` | Mostrar completado |

## 🐍 Python - Configuración Específica

- **LSP**: Pyright (análisis de tipos) + Ruff (linting rápido)
- **Formateo**: Black (automático al guardar)
- **Imports**: isort (organización automática)
- **Indentación**: 4 espacios (PEP 8)

## ⚛️ React - Configuración Específica

- **LSP**: TypeScript Language Server
- **Formateo**: Prettier (automático al guardar)
- **Linting**: ESLint
- **Auto-tags**: Cierre automático de tags JSX
- **Indentación**: 2 espacios (ajustable en opciones)

## 🔧 Personalización

### Cambiar indentación para JavaScript/React

Edita `~/.config/nvim/lua/config/options.lua`:

```lua
-- Para JavaScript/React con 2 espacios
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
```

### Cambiar tema

Edita `~/.config/nvim/lua/plugins/colorscheme.lua` y cambia:
```lua
flavour = "mocha" -- opciones: latte, frappe, macchiato, mocha
```

### Deshabilitar formateo automático

Edita `~/.config/nvim/lua/plugins/none-ls.lua` y comenta la sección `on_attach`.

## 📚 Comandos Útiles

```vim
:Mason              " Abrir gestor de LSP/tools
:Lazy               " Abrir gestor de plugins
:checkhealth        " Verificar salud de Neovim
:TSUpdate           " Actualizar parsers de Treesitter
:LspInfo            " Información de LSP activos
```

## 🆘 Troubleshooting

### Los LSP no funcionan
```vim
:LspInfo            " Ver estado de LSP
:Mason              " Reinstalar servidores
```

### Errores de sintaxis
```vim
:TSUpdate           " Actualizar Treesitter
```

### Plugins no cargan
```vim
:Lazy sync          " Sincronizar plugins
```

## 📖 Recursos

- [Documentación de Neovim](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

---

💡 **Tip**: Presiona `<Space>` y espera para ver todas las opciones disponibles con Which-key!
