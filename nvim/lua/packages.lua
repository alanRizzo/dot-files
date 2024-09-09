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
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("mattn/emmet-vim")

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

	use({ "ckipp01/nvim-jenkinsfile-linter", requires = { "nvim-lua/plenary.nvim" } })

	-- Formatter
	use({ "stevearc/conform.nvim" })

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

	-- surrounding pairs
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
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
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" })
	use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })

	-- Git
	use({
		"dinhhuy258/git.nvim",
		config = function()
			require("git").setup({ default_mappings = true })
		end,
	})

	-- Git Signs
	use({ "lewis6991/gitsigns.nvim" })

	-- Autopair
	use({
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		config = function()
			require("ultimate-autopair").setup({
				--Config goes here
			})
		end,
	})

	-- Tmux / Vim pane navigator
	use({ "alexghergh/nvim-tmux-navigation" })

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
