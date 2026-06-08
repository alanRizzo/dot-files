-- ===================================================================
-- Telescope - Buscador fuzzy
-- ===================================================================

return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  lazy = false,
  priority = 100,
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        path_display = { "truncate" },
        borderchars = {
          prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },

        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-x>"] = actions.delete_buffer,
            ["<Esc>"] = actions.close,
          },
          n = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<Esc>"] = actions.close,
          },
        },

        file_ignore_patterns = {
          "node_modules",
          "__pycache__",
          ".git/",
          "*.pyc",
          "venv/",
          ".venv/",
          "dist/",
          "build/",
        },

        preview = {
          treesitter = false,
        },
      },

      pickers = {
        find_files = {
          hidden = false,
          follow = false,
        },
        git_files = {
          show_untracked = true,
        },
      },
    })

    -- Cargar extensión fzf
    telescope.load_extension("fzf")
  end,
}
