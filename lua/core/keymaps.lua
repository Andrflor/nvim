--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: core/keymaps.lua
-- Description: Key mapping configs
-- Author: Florian Andrieu <andrieu.florian@mail.com>
vim.g.mapleader = ' '
-- Move around splits
vim.keymap.set('n', '<leader>wh', '<C-w>h', {})
vim.keymap.set('n', '<leader>wj', '<C-w>j', {})
vim.keymap.set('n', '<leader>wk', '<C-w>k', {})
vim.keymap.set('n', '<leader>wl', '<C-w>l', {})

-- Reload configuration without restart nvim
vim.keymap.set('n', '<leader>r', ':so %<CR>', {})

-- Telescope
-- <leader> is a space now
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {}) -- open/close
vim.keymap.set('n', '<leader>er', ':NvimTreeRefresh<CR>', {}) -- refresh
vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', {}) -- search file

-- Lsp config
vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {})
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {})
vim.keymap.set('n', '<leader>a', ':CodeActionMenu<CR>', {})


vim.keymap.set('n', '<leader>n', ':tabe<CR>', {})
vim.keymap.set('n', '<leader>d', ':bd<CR>', {})