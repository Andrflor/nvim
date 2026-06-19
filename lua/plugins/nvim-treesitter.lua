--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/nvim-treesitter.lua
-- Description: nvim-treesitter configuration
-- Author: Florian Andrieu <andrieu.florian@mail.com>
local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
  vim.schedule(function()
    vim.notify("nvim-treesitter not found. Run :PackerSync", vim.log.levels.WARN)
  end)
  return
end

treesitter.setup({
  ensure_installed = {
    "go",
    "python",
    "dockerfile",
    "json",
    "yaml",
    "markdown",
    "html",
    "scss",
    "css",
    "vim",
    "lua",
    "bash",
    "c",
    "cpp",
    "javascript",
    "typescript",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = false,
  },

  autotag = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  refactor = {
    highlight_definitions = {
      enable = true,
    },
    highlight_current_scope = {
      enable = false,
    },
  },
})
