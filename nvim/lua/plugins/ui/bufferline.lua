return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        themable = true,
        indicator = { 
          icon = '',
          style = 'icon',
        },
        modified_icon = '-',
        always_show_bufferline = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_buffer_close_icons = false,
        -- highlights = require("catppuccin.groups.integrations.bufferline").get()
      },
    },
  }
}
