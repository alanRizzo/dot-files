-- ===================================================================
-- Treesitter - Resaltado de sintaxis avanzado
-- ===================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag", -- Auto-cierre de tags HTML/JSX
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Lenguajes a instalar
      ensure_installed = {
        "python",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "lua",
        "vim",
        "markdown",
        "bash",
        "yaml",
        "toml",
      },

      -- Instalar parsers de forma síncrona
      sync_install = false,

      -- Instalar automáticamente lenguajes faltantes
      auto_install = true,

      -- Resaltado de sintaxis
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },

      -- Indentación basada en treesitter
      indent = {
        enable = true,
      },

      -- Auto-tag para HTML/JSX
      autotag = {
        enable = true,
      },

      -- Incrementar/decrementar selección
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
