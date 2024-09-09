-- Load Telescope extensions
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.load_extension("fzy_native")

local sorters = require("telescope.sorters")

-- Setup Telescope
telescope.setup({
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		generic_sorter = sorters.get_fzy_sorter,
		file_ignore_patterns = { "node_modules", "package" },
	},
	extensions = {
		-- Fast, fast, really fast sorter
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<space>f", function()
	builtin.find_files({
		hidden = true,
	})
end)
vim.keymap.set("n", "<space>w", builtin.live_grep)
vim.keymap.set("n", "<space>g", builtin.git_status)
--jset("n", "<space>s", "^wy$<ESC>:lua Substitute()<CR>:Telescope live_grep default_text=<C-r>0<CR>")
vim.keymap.set("n", "<space>u", builtin.grep_string)
vim.keymap.set("n", "<space>b", builtin.buffers)
vim.keymap.set("n", "<space>h", builtin.help_tags)
