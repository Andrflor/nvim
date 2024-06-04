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
require('nvim-treesitter.configs').setup {
    -- A list of parser names, or 'all'
    ensure_installed = {'go', 'python', 'dockerfile', 'json', 'yaml', 'markdown', 'html', 'scss', 'css', 'vim', 'dart'},

    highlight = {
        enable = true,
        use_languagetree = false,
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = false
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    refactor = {
        highlight_definitions = {
            enable = true
        },
        highlight_current_scope = {
            enable = false
        }
    }
}
