local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

-- Grep
vim.g.dashboard_default_executive = "telescope"

-- Custom Footer
db.custom_footer = { "make America great again" }

-- Custom Header
db.custom_header = {
  " █████╗ ██╗      █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
  "██╔══██╗██║     ██╔══██╗████╗  ██║██║   ██║██║████╗ ████║",
  "███████║██║     ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║",
  "██╔══██║██║     ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║  ██║███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

-- Dashboard Sections
db.custom_center = {
  {
    icon = " 🚽 ",
    desc = "Recently used files                                    ",
    action = "Telescope oldfiles",
    shortcut = "",
  },
  {
    icon = " 🎪 ",
    desc = "Find file                                     ",
    action = "Telescope find_files",
    shortcut = "<space> f",
  },
  {
    icon = " 👀 ",
    desc = "Find word                                     ",
    action = "Telescope live_grep",
    shortcut = "<space> w",
  },
  {
    icon = " 🚪 ",
    desc = "Key mapping                                         ",
    action = ":e ~/.config/nvim/lua/general/mappings.lua",
    shortcut = "' m",
  },
  {
    icon = " 🚃 ",
    desc = "Packages                                               ",
    action = ":e ~/.config/nvim/lua/packages.lua",
    shortcut = "",
  },
}
