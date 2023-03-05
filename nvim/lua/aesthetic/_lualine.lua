local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local cp = require("catppuccin.palettes").get_palette()
local custom_catppuccin = require("lualine.themes.catppuccin")
custom_catppuccin.normal.b.bg = cp.surface0
custom_catppuccin.normal.c.bg = cp.base
custom_catppuccin.insert.b.bg = cp.surface0
custom_catppuccin.command.b.bg = cp.surface0
custom_catppuccin.visual.b.bg = cp.surface0
custom_catppuccin.replace.b.bg = cp.surface0
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.b.bg = cp.base
custom_catppuccin.inactive.b.fg = cp.surface0
custom_catppuccin.inactive.c.bg = cp.base

lualine.setup({
  options = {
    theme = custom_catppuccin,
    component_separators = "|",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { { "mode" } },
    lualine_b = { { "filename", path = 1 } },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "filetype", "progress" },
    lualine_z = { { "location" } },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "quickfix", "fugitive", "nvim-tree" },
})
