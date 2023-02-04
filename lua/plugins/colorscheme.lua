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
    red    = '#e05c65',
    yellow = '#ffcb6b',
    orange = "#e08555",
  },
  highlights = {
    Pmenu = {
      bg = "None",
    },
    DiagnosticUnderlineError = { sp = "${red}", style = "undercurl" },
    DiagnosticUnderlineWarn = { sp = "${yellow}", style = "undercurl" },
    DiagnosticUnderlineInfo = { sp = "${blue}", style = "undercurl" },
    DiagnosticUnderlineHint = { sp = "${cyan}", style = "undercurl" },
    PmenuSel = {
      bg = "#3e3059"
    },
    PmenuThumb = {
      bg = "#c678dd"
    }
  }
})
