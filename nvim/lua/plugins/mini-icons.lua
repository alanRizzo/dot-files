-- ===================================================================
-- Mini.icons - Iconos para Neovim (alternativa ligera)
-- ===================================================================

return {
  "echasnovski/mini.icons",
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
}
