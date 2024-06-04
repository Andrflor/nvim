--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: core/autocmds.lua
-- Description: Autocommand functions
-- Author: Florian Andrieu <andrieu.florian@mail.com>
-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings

-- Highlight on yank
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = '1000'
    })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Get git blame on line
autocmd('BufEnter', {
  pattern = '',
  command = ':EnableBlameLine'
})

-- Auto format on save using the attached (optionally filtered) language servere clients
-- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
autocmd('BufWritePre', {
  pattern = '*.dart, *.json',
  command = ':silent lua vim.lsp.buf.format()'
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.h',
  command = 'set filetype=c'
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.vert',
  command = 'set filetype=glsl'
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.frag',
  command = 'set filetype=glsl'
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

autocmd('Filetype', {
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml', 'lua' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

autocmd('Filetype', {
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})
