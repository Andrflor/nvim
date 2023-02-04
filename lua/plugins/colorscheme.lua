--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/colorscheme.lua
-- Description: Colorscheme config
-- Author: Florian Andrieu <andrieu.florian@mail.com>
require("onedarkpro").setup({

  options = {
    transparency = true
  },

  -- Colorscheme override
  colors = {
    cyan   = '#56B6C2',
    green  = "#B8DE85",
    blue   = '#51afef',
    red    = '#e54958',
    orange = "#c08555",
    yellow = "#edcd86"
  },
  highlights = {
    Error = {
      fg = "#e05c65",
    },
    Pmenu = {
      bg = "None",
    },
    PmenuSel = {
      bg = "#3e3059"
    },
    PmenuThumb = {
      bg = "#c678dd"
    }
  }
})
