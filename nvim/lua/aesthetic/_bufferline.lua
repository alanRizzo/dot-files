local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

vim.opt.termguicolors = true

bufferline.setup({
  options = {
    indicator = { style = "icon", icon = "" },
    modified_icon = "-",
    show_close_icon = false,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "left", separator = true },
    },
    show_tab_indicators = true,
    show_buffer_close_icons = false,
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
