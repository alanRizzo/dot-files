return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  config = function()
    local alpha = require 'alpha'
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      "                                                         ",
      " █████╗ ██╗      █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "██╔══██╗██║     ██╔══██╗████╗  ██║██║   ██║██║████╗ ████║",
      "███████║██║     ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║",
      "██╔══██║██║     ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║  ██║███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "                                                         ",
    }
    dashboard.section.buttons.val = {
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button("w", "  Find word", ":Telescope live_grep <CR>"),
      dashboard.button("m", "  Key mapping", ":e ~/.config/nvim/lua/config/keymaps.lua <CR>"),
      dashboard.button("u", "  Update plugins", ":Lazy update<CR>"),
    }
    dashboard.config.opts.noautocmd = true
    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
          "",
          "            make America great again            ",
          "",
          "--       Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins   in " .. ms .. "ms       --",
        }
        -- dashboard.section.footer.val = "make America great again\n"
        --     .. "Neovim loaded "
        --     .. stats.loaded
        --     .. "/"
        --     .. stats.count
        --     .. " plugins in "
        --     .. ms
        --     .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
