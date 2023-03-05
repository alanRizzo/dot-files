local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

local custom_header = {
  "                                                         ",
  "                                                         ",
  "                                                         ",
  " █████╗ ██╗      █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
  "██╔══██╗██║     ██╔══██╗████╗  ██║██║   ██║██║████╗ ████║",
  "███████║██║     ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║",
  "██╔══██║██║     ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║  ██║███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
  "                                                         ",
  "                                                         ",
  "                                                         ",
}

local custom_center = {
  {
    icon = " 🚽 ",
    desc = "Recently used files                                    ",
    action = "Telescope oldfiles",
    shortcut = "",
  },
  {
    icon = " 🎪 ",
    desc = "Find file                                              ",
    action = "Telescope find_files",
    shortcut = "<space> f",
  },
  {
    icon = " 👀 ",
    desc = "Find word                                              ",
    action = "Telescope live_grep",
    shortcut = "<space> w",
  },
  {
    icon = " 🚪 ",
    desc = "Key mapping                                            ",
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

db.setup({
  theme = "doom",
  config = {
    header = custom_header,
    center = custom_center,
    footer = { "make America great again" },
  },
})
