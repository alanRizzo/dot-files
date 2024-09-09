local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = { "python", "lua", "vim", "javascript", "tsx", "vimdoc" },
	highlight = { enable = true, disable = { "" } },
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	},
})
