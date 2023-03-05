local fn = vim.fn

-- Install Packer if not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =
      fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.notify("Intalling packer...")
  vim.cmd([[packadd packer.nvim]])
end

-- Protected call for the first time and avoid errors
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Packer with popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return require("packer").startup(function(use)
  -- Packer Itself
  use("wbthomason/packer.nvim")

  -- CMP plugins
  use("hrsh7th/nvim-cmp")        -- The completion plugin
  use("hrsh7th/cmp-buffer")      -- buffer completions
  use("hrsh7th/cmp-path")        -- path completions
  use("hrsh7th/cmp-cmdline")     -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- Snippets
  use("L3MON4D3/LuaSnip")            --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  -- manage external editor tooling such as LSP servers, DAP servers, linters
  use({
    "junnplus/lsp-setup.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  })

  -- Formatter
  use({ "mhartington/formatter.nvim" })

  -- Navigation panel
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.*",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "BurntSushi/ripgrep",
    },
  })

  -- Improve the deletion of buffers
  use("ojroques/nvim-bufdel")

  -- Syntax Highlighting
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Color highlighter
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- Themes
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- UI Plugins
  use({ "glepnir/dashboard-nvim", event = "VimEnter" })
  use("nvim-lualine/lualine.nvim")
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
  use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons", tag = "nightly" })

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- Tmux / Vim pane navigator
  use({ "alexghergh/nvim-tmux-navigation" })

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
