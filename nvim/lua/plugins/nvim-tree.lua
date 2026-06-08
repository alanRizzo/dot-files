-- ===================================================================
-- Nvim-tree - Explorador de archivos
-- ===================================================================

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  priority = 100,
  config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      
      -- Keymaps personalizados
      vim.keymap.set("n", "<Tab>", api.node.navigate.sibling.next, opts("Next Sibling"))
      vim.keymap.set("n", "<S-Tab>", api.node.navigate.sibling.prev, opts("Previous Sibling"))
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
      vim.keymap.set("n", "a", api.fs.create, opts("Create"))
      vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
      vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
      vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
      vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
      vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
      vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
      vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
      vim.keymap.set("n", "q", api.tree.close, opts("Close"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
    end
    
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      on_attach = on_attach,

      view = {
        width = 35,
        side = "left",
      },

      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      filters = {
        dotfiles = false,
        custom = { "^.git$", "^node_modules$", "^__pycache__$" },
      },

      git = {
        enable = true,
        ignore = false,
      },

      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },
    })
  end,
}
