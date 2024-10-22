return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzy-native.nvim", build = "make" },
	},
	cmd = "Telescope",
	keys = {
		{
			"<space>f",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "Find files",
		},
		{
			"<space>w",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<space>g",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Git status",
		},
		{
			"<space>u",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Grep string",
		},
		{
			"<space>b",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<space>h",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help tags",
		},
	},
	config = function()
		local telescope = require("telescope")
		local sorters = require("telescope.sorters")

		telescope.setup({
			defaults = {
				file_sorter = sorters.get_fzy_sorter,
				generic_sorter = sorters.get_fzy_sorter,
				file_ignore_patterns = { "node_modules", "package" },
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})

		telescope.load_extension("fzy_native")
	end,
}
