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
    ensure_installed = {'go', 'python', 'dockerfile', 'json', 'yaml', 'markdown', 'html', 'scss', 'css', 'vim'},

    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = {
        enable = true
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
