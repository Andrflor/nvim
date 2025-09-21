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
vim.keymap.set('', 'k', 'j', { noremap = true })
vim.keymap.set('', '<C-w>k', '<C-w>j', { noremap = true })
vim.keymap.set('', '<C-w><C-k>', '<C-w>j', { noremap = true })

vim.keymap.set('', 'j', 'k', { noremap = true })
vim.keymap.set('', '<C-w>j', '<C-w>k', { noremap = true })
vim.keymap.set('', '<C-w><C-j>', '<C-w>k', { noremap = true })

vim.keymap.set('n', '<leader>h', '<C-w>h', {})
vim.keymap.set('n', '<leader>j', '<C-w>j', {})
vim.keymap.set('n', '<leader>k', '<C-w>k', {})
vim.keymap.set('n', '<leader>l', '<C-w>l', {})

-- Reload configuration without restart nvim
vim.keymap.set('n', '<leader>r', ':so %<CR>', {})

-- Telescope
-- <leader> is a space now
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fd', '<Cmd>Telescope diagnostics<CR>', {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {}) -- open/close
vim.keymap.set('n', '<leader>er', ':NvimTreeRefresh<CR>', {}) -- refresh
vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', {}) -- search file

-- Lsp config
vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', {})
vim.keymap.set('n', 'J', '<Cmd>lua vim.lsp.buf.references()<CR>', {})
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {})
vim.keymap.set('n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})
vim.keymap.set('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', {})
vim.keymap.set('n', '<leader>d', '<Cmd>lua vim.lsp.diagnostic.open_float()<CR>', {})

vim.keymap.set({ "v", "n" }, "<leader>a", require("actions-preview").code_actions)


vim.keymap.set('n', '<leader>n', ':tabe<CR>', {})
vim.keymap.set('n', '<leader>bd', ':bd<CR>', {})

vim.keymap.set(
	{ "n", "o", "x" },
	"w",
	"<cmd>lua require('spider').motion('w')<CR>",
	{ desc = "Spider-w" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"e",
	"<cmd>lua require('spider').motion('e')<CR>",
	{ desc = "Spider-e" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"b",
	"<cmd>lua require('spider').motion('b')<CR>",
	{ desc = "Spider-b" }
)
