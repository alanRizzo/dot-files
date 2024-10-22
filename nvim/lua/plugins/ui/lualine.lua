return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = "catppuccin",
		  component_separators = "|",
		  section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha" },
    },
	  sections = {
	  	lualine_a = { { "mode" } },
	  	lualine_b = { { "filename", path = 1 } },
	  	lualine_c = {},
	  	lualine_x = {},
	  	lualine_y = { "filetype", "progress" },
	  	lualine_z = { { "location" } },
	  },
	  inactive_sections = {
	  	lualine_a = { "filename" },
	  	lualine_b = {},
	  	lualine_c = {},
	  	lualine_x = {},
	  	lualine_y = {},
	  	lualine_z = {},
	  },
	  extensions = { "quickfix", "fugitive" },
	},
}
