-- Define lazypath first
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- Set base46 cache directory
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins.ui" },
		{ import = "plugins.lsp" },
		{ import = "plugins.code" },
	},
	-- automatically check for plugin updates
	checker = { enabled = true, frequency = 86400 }, -- once per day

	install = { colorscheme = { "nvchad" } },
})

-- Load base46 cache files
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end
