return {
	"nvim-lua/plenary.nvim",
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},
	{

		"nvchad/base46",
		lazy = true,
		keys = {
			{
				"<s-l>",
				function()
					require("nvchad.tabufline").next()
				end,
				desc = "Next buffer",
			},
			{
				"<s-h>",
				function()
					require("nvchad.tabufline").prev()
				end,
				desc = "Previous buffer",
			},
			{
				"<s-d>",
				function()
					require("nvchad.tabufline").close_buffer()
				end,
				desc = "Close buffer",
			},
		},
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	"nvchad/volt",
}
