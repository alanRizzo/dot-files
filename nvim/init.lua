-- ===================================================================
-- Configuración Principal de Neovim
-- ===================================================================

-- Bootstrap lazy.nvim (gestor de plugins)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Cargar opciones generales
require("config.options")

-- Cargar keymaps básicos
require("config.keymaps")

-- Cargar plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  -- Add this line to disable LuaRocks support completely
  rocks = {
    enabled = false,
  },
})

-- Cargar keymaps de plugins (después de lazy)
require("config.plugin-keymaps")
