-- ===================================================================
-- Gitsigns - Indicadores Git
-- ===================================================================

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },

    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local keymap = vim.keymap.set
      local opts = { buffer = bufnr }

      -- Navegación entre hunks
      keymap("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, vim.tbl_extend("force", opts, { expr = true, desc = "Siguiente cambio" }))

      keymap("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, vim.tbl_extend("force", opts, { expr = true, desc = "Cambio anterior" }))

      -- Acciones Git
      keymap("n", "<leader>gs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
      keymap("n", "<leader>gr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
      keymap("v", "<leader>gs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
      keymap("v", "<leader>gr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
      keymap("n", "<leader>gS", gs.stage_buffer, vim.tbl_extend("force", opts, { desc = "Stage buffer" }))
      keymap("n", "<leader>gu", gs.undo_stage_hunk, vim.tbl_extend("force", opts, { desc = "Undo stage hunk" }))
      keymap("n", "<leader>gR", gs.reset_buffer, vim.tbl_extend("force", opts, { desc = "Reset buffer" }))
      keymap("n", "<leader>gp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview hunk" }))
      keymap("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, vim.tbl_extend("force", opts, { desc = "Blame line" }))
      keymap("n", "<leader>gd", gs.diffthis, vim.tbl_extend("force", opts, { desc = "Diff this" }))
    end,
  },
}
