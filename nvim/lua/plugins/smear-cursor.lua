-- ===================================================================
-- Smear Cursor - Animación suave del cursor
-- ===================================================================

return {
  "sphamba/smear-cursor.nvim",
  opts = {
    cursor_color = "#d3cdc3",
    normal_bg = "#282828",
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    hide_target_hack = true,
    stiffness = 0.6,
    trailing_stiffness = 0.3,
    distance_stop_animating = 0.1,
    hide_target_hack = true,
  },
}
