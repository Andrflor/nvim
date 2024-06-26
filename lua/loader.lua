--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/loader.lua
-- Description: Plugin manager configuration file
-- Author: Florian Andrieu <andrieu.florian@mail.com>
-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost loader.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup({
  function(use)
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- Treesitter interface
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({
          with_sync = true
        })
      end
    }

    -- LSP - Quickstart configs for Nvim LSP
    use { 'neovim/nvim-lspconfig' }
    -- Mason
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    use "aznhe21/actions-preview.nvim"

    -- Flutter lsp
    use 'akinsho/flutter-tools.nvim'

    -- OneDark Pro - A clean, dark Neovim theme written in Lua, with support for lsp,
    -- treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
    use "olimorris/onedarkpro.nvim"

    -- Github - Github's Neovim themes
    use 'projekt0n/github-nvim-theme'

    -- Statusline
    -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    use 'nvim-lualine/lualine.nvim'

    -- Dev icons
    use 'nvim-tree/nvim-web-devicons'

    -- Smooth scroll
    use 'psliwka/vim-smoothie'

    -- The indent line
    use "lukas-reineke/indent-blankline.nvim"

    -- File explore
    -- nvim-tree.lua - A file explorer tree for neovim written in lua
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons',
        opt = true
      }
    }

    -- Better icons in lsp window
    use "onsails/lspkind.nvim"

    -- Custom text objects
    use "echasnovski/mini.ai"

    -- Autopairs
    use 'windwp/nvim-autopairs'

    use "tveskag/nvim-blame-line"

    -- Autocomplete
    -- A completion plugin for neovim coded in Lua.
    use {
      'hrsh7th/nvim-cmp',
      requires = { 'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip' }
    }

    -- Async handling
    use "nvim-lua/plenary.nvim"

    -- Use Neovim as a language server to inject LSP diagnostics,
    -- code actions, and more via Lua.
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Smart and powerful comment plugin for neovim.
    -- Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    use 'numToStr/Comment.nvim'

    -- Git integration for buffers
    use 'lewis6991/gitsigns.nvim'

    -- Colorizer
    use 'NvChad/nvim-colorizer.lua'

    use 'HiPhish/rainbow-delimiters.nvim'


    -- Camel Case motion
    use  "chrisgrieser/nvim-spider"

    -- Telescope
    -- Find, Filter, Preview, Pick. All lua, all the time.
    use {
      'nvim-telescope/telescope.nvim',
      branch = '0.1.x',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
      requires = { 'nvim-telescope/telescope.nvim' }
    }

    -- Workspace diagnostics
    use 'folke/trouble.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({
          border = 'single'
        })
      end
    },
    profile = {
      enable = false
    }
  }
})
