return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<C-n>",
				"<cmd>Yazi<cr>",
				desc = "Open file manager",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "?",
				open_file_in_vertical_split = "<c-v>",
				open_file_in_horizontal_split = "<c-s>",
			},
		},
	},
	{
		"yazi-rs/flavors",
		name = "yazi-flavor-catppuccino-frappe",
		lazy = true,
		build = function(spec)
			require("yazi.plugin").build_flavor(spec, {
				sub_dir = "catppuccin-frappe.yazi",
			})
		end,
	},
}
