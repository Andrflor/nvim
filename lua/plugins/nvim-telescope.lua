--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/nvim-telescope.lua
-- Description: nvim-telescope config
-- Author: Florian Andrieu <andrieu.florian@mail.com>
require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = { width = 0.9 },
        -- other layout configuration here
        },
    -- other defaults configuration here
    },
  -- other configuration values here
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
