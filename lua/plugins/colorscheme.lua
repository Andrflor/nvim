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

vim.opt.termguicolors = true

local kitty = {
  fg = "#d8dee9",
  bg = "#0f111a",

  cyan = "#56B6C2",
  green = "#B8DE85",
  blue = "#51afef",
  red = "#e05c65",
  yellow = "#ffcb6b",
  orange = "#e08555",
  purple = "#c678dd",

  bg_dark = "#090b11",
  bg_light = "#151824",
  selection = "#1f2433",
  comment = "#4c566a",
}

require("onedarkpro").setup({
  options = {
    transparency = true,
  },

  -- Kitty based colorscheme override
  colors = {
    bg = kitty.bg,
    fg = kitty.fg,

    cyan = kitty.cyan,
    green = kitty.green,
    blue = kitty.blue,
    red = kitty.red,
    yellow = kitty.yellow,
    orange = kitty.orange,
    purple = kitty.purple,
  },

  highlights = {
    Normal = {
      bg = "NONE",
      fg = kitty.fg,
    },

    NormalNC = {
      bg = "NONE",
      fg = kitty.fg,
    },

    NormalFloat = {
      bg = "NONE",
      fg = kitty.fg,
    },

    FloatBorder = {
      bg = "NONE",
      fg = kitty.blue,
    },

    SignColumn = {
      bg = "NONE",
    },

    LineNr = {
      bg = "NONE",
      fg = kitty.comment,
    },

    CursorLine = {
      bg = kitty.bg_light,
    },

    CursorLineNr = {
      bg = "NONE",
      fg = kitty.yellow,
    },

    Visual = {
      bg = kitty.selection,
    },

    Search = {
      bg = kitty.yellow,
      fg = kitty.bg,
    },

    IncSearch = {
      bg = kitty.orange,
      fg = kitty.bg,
    },

    Pmenu = {
      bg = "NONE",
      fg = kitty.fg,
    },

    PmenuSel = {
      bg = kitty.selection,
      fg = kitty.fg,
    },

    PmenuThumb = {
      bg = kitty.purple,
    },

    DiagnosticUnderlineError = {
      sp = kitty.red,
      style = "undercurl",
    },

    DiagnosticUnderlineWarn = {
      sp = kitty.yellow,
      style = "undercurl",
    },

    DiagnosticUnderlineInfo = {
      sp = kitty.blue,
      style = "undercurl",
    },

    DiagnosticUnderlineHint = {
      sp = kitty.cyan,
      style = "undercurl",
    },
  },
})

vim.cmd("colorscheme onedark")
